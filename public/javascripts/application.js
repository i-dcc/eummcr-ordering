// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// First, get our settings for our orders
var VAT_RATE     = 0;
var EXTRAS_PRICE = {};
var PRODUCT_TYPE = {};

$.getJSON('/settings.json', function(data){
  VAT_RATE     = parseFloat(data['vat']);
  PRODUCT_TYPE = data['product_type'];
  
  $.each(data,function(value){
    if ( value.match(/\_price$/) ) {
      EXTRAS_PRICE[ value.replace('_price','') ] = data[value];
    }
  });
});

// Extension to the Number class - this forces a currency format.
// All credit to here: http://snippets.dzone.com/posts/show/425
Number.prototype.formatMoney = function(c, d, t){
  var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
  return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};

// Function to strip out the relevant form data from an 
// ordered product table row.
function ordered_product_details (ordered_product_row) {
  var product_info = {
    ordered_product_type_id:  $(ordered_product_row).find('select.ordered_product_type_id').val(),
    genotyping:               $(ordered_product_row).find('input:checkbox.genotyping:checked').first().size() ? true : false,
    extra_vial_per_clone:     $(ordered_product_row).find('input:checkbox.extra_vial_per_clone:checked').first().size() ? true : false,
    allele_qc:                $(ordered_product_row).find('input:checkbox.allele_qc:checked').first().size() ? true : false,
    karyotyping:              $(ordered_product_row).find('input:checkbox.karyotyping:checked').first().size() ? true : false,
    replacement_vials:        $(ordered_product_row).find('input:checkbox.replacement_vials:checked').first().size() ? true : false
  };
  
  return product_info;
}

// Function to calculate the price of an individual product 
// based on the product_type and the extra things ordered.
function ordered_product_price (product_info) {
  var product_price                        = Number(0.00);
  var ordered_product_type                 = PRODUCT_TYPE[product_info['ordered_product_type_id']];
  
  if ( ordered_product_type ) {
    var ordered_product_type_clone_count     = Number(ordered_product_type['clone_count']);
    product_price                           += Number(ordered_product_type['price']);
    product_info['ordered_product_type_id']  = false;
    
    if ( ordered_product_type_clone_count > 0 ) {
      $.each(product_info,function(value) {
        if ( product_info[value] ) {
          if ( value == 'replacement_vials' ) {
            product_price = ( Number(EXTRAS_PRICE['replacement_vials']['price']) * ordered_product_type_clone_count );
          } else {
            if (EXTRAS_PRICE[value]['per'] == 'gene') {
              product_price += Number(EXTRAS_PRICE[value]['price']);
            } else if (EXTRAS_PRICE[value]['per'] == 'clone') {
              product_price += ( Number(EXTRAS_PRICE[value]['price']) * ordered_product_type_clone_count );
            }
          }
        }
      });
    }
  }
  
  return product_price;
}

// Function to enable/disable the checkboxes in the ordered 
// product table.  The 'extras' are only available for ES Cell 
// products, but if you're ordering replacement_vials - you can't 
// order any other 'extras'.
function ordered_product_checkbox_update (ordered_product_row,product_info) {
  var ordered_product_type             = PRODUCT_TYPE[product_info['ordered_product_type_id']];
  var totally_disable_checkboxes       = false;
  
  if ( ordered_product_type ) {
    if ( Number(ordered_product_type['clone_count']) > 0 ) {
      $(ordered_product_row).find('input:checkbox').removeAttr('disabled');
      if ( product_info['replacement_vials'] ) {
        $(ordered_product_row).find('input:checkbox:checked').each(function(index) {
          if ( ! $(this).hasClass('replacement_vials') ) { $(this).removeAttr('checked') };
        });
      }
    } else {
      totally_disable_checkboxes = true;
    }
  } else {
    totally_disable_checkboxes = true;
  }
  
  if (totally_disable_checkboxes) {
    $(ordered_product_row).find('input:checkbox').removeAttr('checked').attr('disabled',true);
  }
}

// Function to calculate the subtotal (before shipping and tax) for 
// the whole order.
function order_subtotal_price () {
  var subtotal = Number(0.00);
  $('#ordered_products').find('input.price').each(function(index) {
    subtotal += Number( $(this).val() );
  });
  return subtotal;
}

// Function to calculate the shipping cost for the whole order. 
// Basically it's the most expensive shipping price for a single 
// product that has been ordered.
function order_shipping_price () {
  var shipping_costs = [Number(0.00)];
  $('#ordered_products').find('select.ordered_product_type_id').each(function(index) {
    var ordered_product_type = PRODUCT_TYPE[ $(this).val() ];
    if ( ordered_product_type ) {
      shipping_costs.push( Number(ordered_product_type['shipping']) );
    }
  });
  return shipping_costs.sort( function(a,b){ return b - a } )[0];
}

// Function to update all of the total prices at the bottom of the form
function order_update_total_prices () {
  var subtotal = order_subtotal_price();
  
  if (subtotal > 0) {
    var shipping = order_shipping_price();
    var vat      = Number( ( ( subtotal + shipping ) / 100 ) * order_vat_rate() );
    var total    = Number( subtotal + shipping + vat );
    
    $('input#subtotal').val( subtotal.formatMoney(2,'.','') );
    $('input#shipping').val( shipping.formatMoney(2,'.','') );
    $('input#vat').val( vat.formatMoney(2,'.','') );
    $('input#total').val( total.formatMoney(2,'.','') );
  }
}

// Function to set the VAT rate for the form.  If the requestor is in 
// the EU, we use VAT_RATE - if outside, it's 0.00.
function order_vat_rate () {
  var eu_vat = $('#order_tax_eu_member_state_input input:checkbox:checked').first().size() ? true : false;
  if ( eu_vat ) { return VAT_RATE; } 
  else          { return Number(0.00); }
}

// Observe the ordered_product table rows.
$('tr.ordered_product').live('change', function () {
  // Check all of the data-points...
  var product_info = ordered_product_details(this);
  
  // Amend the checkbox selections if needed...
  ordered_product_checkbox_update(this,product_info);
  
  // Re-check all of the data-points...
  product_info = ordered_product_details(this);
  
  // Calculate the price for this product, and the totals for the order...
  var product_price  = ordered_product_price(product_info);
  $(this).find('input.price').val( product_price.formatMoney(2,'.','') );
  
  order_update_total_prices();
});

// Observe the 'EU Member State?' checkbox - this toggles the amount of tax 
// we need to charge.
$('#order_tax_eu_member_state_input input:checkbox').live('change', function () {
  var vat = order_vat_rate();
  $('#vat_description').html( vat.formatMoney(1,'.','') + '&#37; VAT' );
  order_update_total_prices();
});
