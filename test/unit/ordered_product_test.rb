require 'test_helper'

class OrderedProductTest < ActiveSupport::TestCase
  setup do
    VCR.insert_cassette( "unit-ordered_product_test" )
  end
  
  teardown do
    VCR.eject_cassette
  end
  
  should belong_to :order
  should belong_to :ordered_product_type
  
  should validate_presence_of :gene
  
  context "An OrderedProduct" do
    should "validate the solr response for a marker_symbol" do
      good_gene_obj = Factory.build(:ordered_product)
      assert( good_gene_obj.save, "Unable to save the details of a good gene: '#{good_gene_obj.gene}'")
      
      bad_gene      = 'wibbleblip1'
      bad_gene_obj  = Factory.build(:ordered_product, :gene => bad_gene)
      
      assert( !bad_gene_obj.save, "Saved a BAD gene?!?!? '#{bad_gene}'")
      assert( !bad_gene_obj.valid?, "The validations for the BAD gene are failing... '#{bad_gene}'")
      assert( bad_gene_obj.errors[:gene].first =~ /unable to lookup details for this gene/ )
    end
    
    should "correct slightly off gene symbols" do
      ordered_product = Factory.create(:ordered_product, :gene => 'cbx1')
      assert_equal('Cbx1', ordered_product.gene)
    end
  end
end
