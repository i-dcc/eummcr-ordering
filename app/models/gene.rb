class Gene < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products
  
  validates_presence_of :symbol
  validates_uniqueness_of :symbol
  validate :validate_solr_response
  
  def mgi_accession_id
    find_in_solr["mgi_accession_id"]
  end
  
  private
  
  def validate_solr_response
    unless symbol.nil?
      if solr_response["response"]["numFound"] != 1
        errors.add( :symbol, "unable to lookup details for this gene from the IKMC - please try again in 10 minutes, or contact mouseportal@sanger.ac.uk" )
      end
    end
  end
  
  def solr_response
    SOLR.get 'select', :params => { :q => "marker_symbol:#{symbol}" }
  end
  
  def find_in_solr
    solr_response["response"]["docs"][0]
  end
end
