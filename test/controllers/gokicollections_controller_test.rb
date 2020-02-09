require 'test_helper'

class GokicollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gokicollections_index_url
    assert_response :success
  end

  test "should get new" do
    get gokicollections_new_url
    assert_response :success
  end

  test "should get edit" do
    get gokicollections_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get gokicollections_destroy_url
    assert_response :success
  end

end
