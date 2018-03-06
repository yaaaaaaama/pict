require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get goods_create_url
    assert_response :success
  end

  test "should get delete" do
    get goods_delete_url
    assert_response :success
  end

end
