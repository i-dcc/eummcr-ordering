class OrderedProductType < ActiveRecord::Base
  has_many :ordered_products
  
  validates_uniqueness_of :product_type
  
  validates_presence_of :price
  validates_presence_of :shipping
end
