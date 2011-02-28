class OrderedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :gene
  
  validates_presence_of :order_id
  validates_presence_of :gene_id
  validates_presence_of :product
end
