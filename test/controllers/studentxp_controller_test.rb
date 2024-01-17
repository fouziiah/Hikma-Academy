require "test_helper"

class StudentxpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get studentxp_index_url
    assert_response :success
  end
end
