require 'test_helper'

class OrderedProductTypeTest < ActiveSupport::TestCase
  should have_many              :ordered_products
  should validate_uniqueness_of :product_type
end
