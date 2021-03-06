class OrderedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :ordered_product_type
  
  attr_accessor :nested
  
  validates_presence_of :order_id, :on => :save, :unless => :nested
  validates_presence_of :ordered_product_type_id
  validates_presence_of :gene
  validates_presence_of :price
  
  validate :validate_solr_response
  
  before_save { |product| product.gene = find_in_solr['marker_symbol'] }
  
  def mgi_accession_id
    find_in_solr['mgi_accession_id']
  end
  
  private
  
  def validate_solr_response
    unless gene.nil?
      if find_in_solr.nil?
        errors.add( :gene, "unable to lookup details for this gene '#{gene}' from the IKMC - please try again in 10 minutes, or contact mouseportal@sanger.ac.uk" )
      end
    end
  end
  
  def find_in_solr
    solr_response = SOLR.get 'select', :params => { :q => "#{gene}" }
    docs          = []
    
    solr_response['response']['docs'].each do |doc|
      docs.push(doc) if doc['marker_symbol'].downcase == gene.downcase
    end
    
    docs.first
  end
end
