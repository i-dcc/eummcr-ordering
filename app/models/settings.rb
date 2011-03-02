class Settings < ActiveRecord::Base
  validates_uniqueness_of :key, :scope => [:value]
end
