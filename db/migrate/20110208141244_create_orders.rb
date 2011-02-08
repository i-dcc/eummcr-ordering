class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :recipient_institute_name, :null => false
      t.string :recipient_institute_additional_address_line
      t.string :recipient_institute_street, :null => false
      t.string :recipient_institute_state
      t.string :recipient_institute_city, :null => false
      t.string :recipient_institute_zip, :null => false
      t.string :recipient_institute_country, :null => false
      t.string :shipping_address_institute
      t.string :shipping_address_person
      t.string :shipping_address_additional_address_line
      t.string :shipping_address_street
      t.string :shipping_address_state
      t.string :shipping_address_city
      t.string :shipping_address_zip
      t.string :recipient_principal_scientist_person, :null => false
      t.string :recipient_principal_scientist_institute, :null => false
      t.string :recipient_principal_scientist_additional_address_line
      t.string :recipient_principal_scientist_street
      t.string :recipient_principal_scientist_state
      t.string :recipient_principal_scientist_city
      t.string :recipient_principal_scientist_zip
      t.string :recipient_principal_scientist_phone, :null => false
      t.string :recipient_principal_scientist_fax
      t.string :recipient_principal_scientist_email, :null => false
      t.string :recipient_authorized_official_person, :null => false
      t.string :recipient_authorized_official_institute
      t.string :recipient_authorized_official_additional_address_line
      t.string :recipient_authorized_official_street
      t.string :recipient_authorized_official_state
      t.string :recipient_authorized_official_city
      t.string :recipient_authorized_official_zip
      t.string :recipient_authorized_official_phone, :null => false
      t.string :recipient_authorized_official_fax, :null => false
      t.string :recipient_authorized_official_email
      t.string :billing_address_institute
      t.string :billing_address_additional_address_line
      t.string :billing_address_street
      t.string :billing_address_state
      t.string :billing_address_city
      t.string :billing_address_country
      t.string :billing_address_reference
      t.boolean :tax_eu_member_state, :null => false
      t.string :tax_eu_vat_id
      t.text :usage_aims_of_experiments
      t.text :usage_eu_projects

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
