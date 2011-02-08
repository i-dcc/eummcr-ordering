require 'test_helper'

class OrderTest < ActiveSupport::TestCase
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
  
end
