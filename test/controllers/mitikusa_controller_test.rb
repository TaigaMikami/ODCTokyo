require 'test_helper'

class MitikusaControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get mitikusa_top_url
    assert_response :success
  end

  test "should get index" do
    get mitikusa_index_url
    assert_response :success
  end

  test "should get show" do
    get mitikusa_show_url
    assert_response :success
  end

end
