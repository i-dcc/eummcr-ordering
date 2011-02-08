class Clone < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validate :validate_solr_response
  
  def mgi_accession_id
    find_in_solr["mgi_accession_id"]
  end
  
  def marker_symbol
    find_in_solr["marker_symbol"]
  end
  
  private
  
  def validate_solr_response
    unless name.nil?
      if solr_response["response"]["numFound"] != 1
        errors.add( :name, "unable to lookup details for this ES cell clone from the IKMC - please try again in 10 minutes, or contact mouseportal@sanger.ac.uk" )
      end
    end
  end
  
  def solr_response
    JSON.parse( SOLR.get 'select', :params => { :q => "escell:#{name}" } )
  end
  
  def find_in_solr
    solr_response["response"]["docs"][0]
  end
end
