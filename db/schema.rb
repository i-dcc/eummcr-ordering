# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110301171307) do

  create_table "ordered_product_types", :force => true do |t|
    t.string   "product_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ordered_product_types", ["product_type"], :name => "index_ordered_product_types_on_product_type", :unique => true

  create_table "ordered_products", :force => true do |t|
    t.integer  "order_id"
    t.string   "gene",                                       :null => false
    t.boolean  "genotyping",              :default => false
    t.boolean  "extra_vial_per_clone",    :default => false
    t.boolean  "allele_qc",               :default => false
    t.boolean  "karyotyping",             :default => false
    t.boolean  "replacement_vials",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordered_product_type_id",                    :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "recipient_institute_name",                                                :null => false
    t.string   "recipient_institute_additional_address_line"
    t.string   "recipient_institute_street",                                              :null => false
    t.string   "recipient_institute_state"
    t.string   "recipient_institute_city",                                                :null => false
    t.string   "recipient_institute_zip",                                                 :null => false
    t.string   "recipient_institute_country",                                             :null => false
    t.string   "shipping_address_institute"
    t.string   "shipping_address_person"
    t.string   "shipping_address_additional_address_line"
    t.string   "shipping_address_street"
    t.string   "shipping_address_state"
    t.string   "shipping_address_city"
    t.string   "shipping_address_zip"
    t.string   "recipient_principal_scientist_person",                                    :null => false
    t.string   "recipient_principal_scientist_institute",                                 :null => false
    t.string   "recipient_principal_scientist_additional_address_line"
    t.string   "recipient_principal_scientist_street"
    t.string   "recipient_principal_scientist_state"
    t.string   "recipient_principal_scientist_city"
    t.string   "recipient_principal_scientist_zip"
    t.string   "recipient_principal_scientist_phone",                                     :null => false
    t.string   "recipient_principal_scientist_fax"
    t.string   "recipient_principal_scientist_email",                                     :null => false
    t.string   "recipient_authorized_official_person",                                    :null => false
    t.string   "recipient_authorized_official_institute"
    t.string   "recipient_authorized_official_additional_address_line"
    t.string   "recipient_authorized_official_street"
    t.string   "recipient_authorized_official_state"
    t.string   "recipient_authorized_official_city"
    t.string   "recipient_authorized_official_zip"
    t.string   "recipient_authorized_official_phone",                                     :null => false
    t.string   "recipient_authorized_official_fax",                                       :null => false
    t.string   "recipient_authorized_official_email"
    t.string   "billing_address_institute"
    t.string   "billing_address_additional_address_line"
    t.string   "billing_address_street"
    t.string   "billing_address_state"
    t.string   "billing_address_city"
    t.string   "billing_address_country"
    t.string   "billing_address_reference"
    t.boolean  "tax_eu_member_state",                                   :default => true
    t.string   "tax_eu_vat_id"
    t.text     "usage_aims_of_experiments"
    t.text     "usage_eu_projects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "ordered_products", "ordered_product_types", :name => "ordered_products_ordered_product_type_id_fk"
  add_foreign_key "ordered_products", "orders", :name => "ordered_products_order_id_fk"

end
