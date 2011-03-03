class OrderedProductType < ActiveRecord::Base
  has_many :ordered_products
  
  validates_uniqueness_of :product_type
  
  validates_presence_of :price
  validates_presence_of :shipping
  
  def clone_count
    match = product_type.match(/ES Cell Clones \((\d) Clone/)
    count = match[1].to_i if match
    return count || 0
  end
end
