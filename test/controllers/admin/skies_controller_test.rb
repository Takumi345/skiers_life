require "test_helper"

class Admin::SkiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_skies_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_skies_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_skies_destroy_url
    assert_response :success
  end
end
