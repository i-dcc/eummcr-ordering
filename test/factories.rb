
Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.define :order do |order|
  order.recipient_institute_name                  'Wellcome Trust Sanger Institute'
  order.recipient_institute_street                'Genome Campus Hinxton'
  order.recipient_institute_city                  'Cambridge'
  order.recipient_institute_zip                   'CB10 1SA'
  order.recipient_institute_country               'United Kingdom'
  order.shipping_address_institute                'Wellcome Trust Sanger Institute'
  order.shipping_address_person                   'Rodney Trotter'
  order.shipping_address_street                   'Genome Campus Hinxton'
  order.shipping_address_city                     'Cambridge'
  order.shipping_address_zip                      'CB10 1SA'
  order.recipient_principal_scientist_person      'Derek Trotter'
  order.recipient_principal_scientist_institute   'Wellcome Trust Sanger Institute'
  order.recipient_principal_scientist_street      'Genome Campus Hinxton'
  order.recipient_principal_scientist_city        'Cambridge'
  order.recipient_principal_scientist_zip         'CB10 1SA'
  order.recipient_principal_scientist_phone       '+44 (0)1223 834244'
  order.recipient_principal_scientist_fax         '+44 (0)1223 494919'
  order.recipient_principal_scientist_email       { Factory.next(:email) }
  order.recipient_authorized_official_person      'Trigger'
  order.recipient_authorized_official_institute   'Wellcome Trust Sanger Institute'
  order.recipient_authorized_official_street      'Genome Campus Hinxton'
  order.recipient_authorized_official_city        'Cambridge'
  order.recipient_authorized_official_zip         'CB10 1SA'
  order.recipient_authorized_official_phone       '+44 (0)1223 834244'
  order.recipient_authorized_official_fax         '+44 (0)1223 494919'
  order.recipient_authorized_official_email       { Factory.next(:email) }
  order.billing_address_institute                 'Wellcome Trust Sanger Institute'
  order.billing_address_street                    'Genome Campus Hinxton'
  order.billing_address_city                      'Cambridge'
  order.billing_address_country                   'United Kingdom'
  order.billing_address_reference                 'PO-12345678'
  order.tax_eu_member_state                       true
end

Factory.define :ordered_product do |product|
  product.gene                      { ['Ablim1','Cbx7','Cbx1','Mysm1','M6pr'].sort_by { rand }[0] }
  product.ordered_product_type_id   { OrderedProductType.all.sort_by { rand }[0].id }
  product.genotyping                { [true,false].sort_by { rand }[0] }
  product.extra_vial_per_clone      { [true,false].sort_by { rand }[0] }
  product.allele_qc                 { [true,false].sort_by { rand }[0] }
  product.karyotyping               { [true,false].sort_by { rand }[0] }
  product.replacement_vials         { [true,false].sort_by { rand }[0] }
  
  product.association :order
end
