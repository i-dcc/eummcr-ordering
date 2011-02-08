class Order < ActiveRecord::Base
  validates_presence_of :recipient_institute_name
  validates_presence_of :recipient_institute_street
  validates_presence_of :recipient_institute_city
  validates_presence_of :recipient_institute_zip
  validates_presence_of :recipient_institute_country
  
  validates_presence_of :recipient_principal_scientist_person
  validates_presence_of :recipient_principal_scientist_institute
  validates_presence_of :recipient_principal_scientist_phone
  validates_presence_of :recipient_principal_scientist_email
  
  validates_presence_of :recipient_authorized_official_person
  validates_presence_of :recipient_authorized_official_phone
  validates_presence_of :recipient_authorized_official_fax
  
  validates_presence_of :tax_eu_member_state
  
  
end
