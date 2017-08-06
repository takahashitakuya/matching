require 'test_helper'

class MonologsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get monologs_index_url
    assert_response :success
  end

  test "should get show" do
    get monologs_show_url
    assert_response :success
  end

  test "should get edit" do
    get monologs_edit_url
    assert_response :success
  end

  test "should get new" do
    get monologs_new_url
    assert_response :success
  end

end
