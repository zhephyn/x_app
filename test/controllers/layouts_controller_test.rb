require "test_helper"

class LayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get layout_page" do
    get layouts_layout_page_url
    assert_response :success
  end

  test "should get login_page" do
    get layouts_login_page_url
    assert_response :success
  end
end
