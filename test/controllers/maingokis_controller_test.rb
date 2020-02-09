require 'test_helper'

class MaingokisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get maingokis_index_url
    assert_response :success
  end

end
