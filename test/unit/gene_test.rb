require 'test_helper'

class GeneTest < ActiveSupport::TestCase
  setup do
    VCR.insert_cassette( "unit-gene_test" )
  end
  
  teardown do
    VCR.eject_cassette
  end
  
  context "A Gene Model" do
    should validate_presence_of(:symbol)
    should validate_uniqueness_of(:symbol)
    
    should "validate the solr response for a marker_symbol" do
      good_gene = 'Art4'
      bad_gene  = 'wibbleblip1'
      
      good_gene_obj = Gene.new( :symbol => good_gene )
      bad_gene_obj  = Gene.new( :symbol => bad_gene )
      
      assert( good_gene_obj.save, "Unable to save the details of a good gene: '#{good_gene}'")
      
      assert( !bad_gene_obj.save, "Saved a BAD gene?!?!? '#{bad_gene}'")
      assert( !bad_gene_obj.valid?, "The validations for the BAD gene are failing... '#{bad_gene}'")
      assert( bad_gene_obj.errors[:symbol].first =~ /unable to lookup details for this gene from the IKMC/ )
    end
  end
end
