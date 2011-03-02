class OrderedProductType < ActiveRecord::Base
  has_many :ordered_products
  
  validates_uniqueness_of :product_type
end
