# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ordered_product_types = OrderedProductType.create([
  { :product_type => 'Vectors - Trapped',                               :price => 200.00,   :shipping => 50.00  },
  { :product_type => 'Vectors - Targeted, Intermediate',                :price => 200.00,   :shipping => 50.00  },
  { :product_type => 'Vectors - Intermediate Targeting Cassette Only',  :price => 50.00,    :shipping => 50.00  },
  { :product_type => 'Vectors - Targeted, Final',                       :price => 200.00,   :shipping => 50.00  },
  { :product_type => 'Mutant ES Cell Clones (1 Clone)',                 :price => 700.00,   :shipping => 300.00 },
  { :product_type => 'Mutant ES Cell Clones (2 Clones)',                :price => 1000.00,  :shipping => 300.00 },
  { :product_type => 'Mutant ES Cell Clones (3 Clones)',                :price => 1300.00,  :shipping => 300.00 },
  { :product_type => 'Mutant ES Cell Clones (4 Clones)',                :price => 1600.00,  :shipping => 300.00 },
  { :product_type => 'Mutant ES Cell Clones (5 Clones)',                :price => 1900.00,  :shipping => 300.00 },
  { :product_type => '1 Wild Type Line',                                :price => 1000.00,  :shipping => 50.00  }
])

application_settings = Settings.create([
  { :key => "vat",                        :value => '19.00'  },
  { :key => "genotyping_price",           :value => '{ "price":300.00, "per":"gene" }'  },
  { :key => "allele_qc_price",            :value => '{ "price":500.00, "per":"gene" }'  },
  { :key => "karyotyping_price",          :value => '{ "price":400.00, "per":"clone" }' },
  { :key => "extra_vial_per_clone_price", :value => '{ "price":200.00, "per":"clone" }' },
  { :key => "replacement_vials_price",    :value => '{ "price":200.00, "per":"clone" }' }
])