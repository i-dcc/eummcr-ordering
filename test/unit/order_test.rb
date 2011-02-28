require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    VCR.insert_cassette( "unit-order_test" )
  end
  
  teardown do
    VCR.eject_cassette
  end
  
  should have_many            :ordered_products
  
  should validate_presence_of :recipient_institute_name
  should validate_presence_of :recipient_institute_street
  should validate_presence_of :recipient_institute_city
  should validate_presence_of :recipient_institute_zip
  should validate_presence_of :recipient_institute_country
  should validate_presence_of :recipient_principal_scientist_person
  should validate_presence_of :recipient_principal_scientist_institute
  should validate_presence_of :recipient_principal_scientist_phone
  should validate_presence_of :recipient_principal_scientist_email
  should validate_presence_of :recipient_authorized_official_person
  should validate_presence_of :recipient_authorized_official_phone
  should validate_presence_of :recipient_authorized_official_fax
  should validate_presence_of :tax_eu_member_state
  
  context "An Order Model" do
    should "validate email addresses correctly" do
      test_order = Factory.create(:order)
      
      orig_email = test_order.recipient_principal_scientist_email.dup
      test_order.recipient_principal_scientist_email = 'wibble'
      
      assert( !test_order.save, "The email validation on 'recipient_principal_scientist_email' has failed." )
      
      test_order.recipient_principal_scientist_email = orig_email
      
      assert( test_order.valid?, "The test_order object is not valid after we corrected the 'recipient_principal_scientist_email' field..." )
      assert( test_order.save )
      
      orig_email = test_order.recipient_authorized_official_email.dup
      test_order.recipient_authorized_official_email = 'foobar...'
      
      assert( !test_order.save, "The email validation on 'recipient_authorized_official_email' has failed." )
      
      test_order.recipient_authorized_official_email = orig_email
      
      assert( test_order.valid?, "The test_order object is not valid after we corrected the 'recipient_authorized_official_email' field..." )
      assert( test_order.save )
    end
  end
end
