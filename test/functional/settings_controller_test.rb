require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should NOT get index" do
    get :index
    assert_response 302
  end
  
  test "should get JSON settings" do
    get :'index', { :format => 'json' }
    assert_response :success
    resp = JSON.parse(@response.body)
    assert_not_nil(resp)
  end

end
