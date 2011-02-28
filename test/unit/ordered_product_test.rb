require 'test_helper'

class OrderedProductTest < ActiveSupport::TestCase
  should belong_to :order
  should belong_to :gene
  
  should validate_presence_of :product
end
