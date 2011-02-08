require 'test_helper'

class CloneTest < ActiveSupport::TestCase
  setup do
    VCR.insert_cassette( "unit-clone_test" )
  end
  
  teardown do
    VCR.eject_cassette
  end
  
  context "A Clone" do
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    
    should "validate the solr response for a clone" do
      good_clone = 'EPD0445_7_A03'
      bad_clone  = 'EPD0001_12_A01'
      
      good_clone_obj = Clone.new( :name => good_clone )
      bad_clone_obj  = Clone.new( :name => bad_clone )
      
      assert( good_clone_obj.save, "Unable to save the details of a good clone: '#{good_clone}'")
      
      assert( !bad_clone_obj.save, "Saved a BAD clone?!?!? '#{bad_clone}'")
      assert( !bad_clone_obj.valid?, "The validations for the BAD clone are failing... '#{bad_clone}'")
      assert( bad_clone_obj.errors[:name].first =~ /unable to lookup details for this ES cell clone from the IKMC/ )
    end
  end
end
