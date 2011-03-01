class Order < ActiveRecord::Base
  has_many :ordered_products, :dependent => :destroy 
  
  accepts_nested_attributes_for :ordered_products, :allow_destroy => true, :reject_if => lambda { |a| a[:gene].blank? }
  
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
  
  validates :recipient_principal_scientist_email, :email => true
  validates :recipient_authorized_official_email, :email => true
end
