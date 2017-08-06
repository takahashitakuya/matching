require 'test_helper'

class CoverImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cover_images_index_url
    assert_response :success
  end

  test "should get show" do
    get cover_images_show_url
    assert_response :success
  end

  test "should get profile" do
    get cover_images_profile_url
    assert_response :success
  end

end
