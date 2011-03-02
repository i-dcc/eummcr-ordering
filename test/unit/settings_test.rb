require 'test_helper'

class SettingsTest < ActiveSupport::TestCase
  should validate_uniqueness_of(:key).scoped_to([:value])
end
