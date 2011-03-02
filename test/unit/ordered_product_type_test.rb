require 'test_helper'

class OrderedProductTypeTest < ActiveSupport::TestCase
  should have_many              :ordered_products
  
  should validate_uniqueness_of :product_type
  
  should validate_presence_of   :price
  should validate_presence_of   :shipping
end
