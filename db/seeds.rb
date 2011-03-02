# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ordered_product_types = OrderedProductType.create([
  { :product_type => 'Vectors - Trapped' },
  { :product_type => 'Vectors - Targeted, Intermediate' },
  { :product_type => 'Vectors - Intermediate Targeting Cassette Only' },
  { :product_type => 'Vectors - Targeted, Final' },
  { :product_type => 'Mutant ES Cell Clones (1 Clone)' },
  { :product_type => 'Mutant ES Cell Clones (2 Clones)' },
  { :product_type => 'Mutant ES Cell Clones (3 Clones)' },
  { :product_type => 'Mutant ES Cell Clones (4 Clones)' },
  { :product_type => 'Mutant ES Cell Clones (5 Clones)' },
  { :product_type => '1 Wild Type Line' },
])