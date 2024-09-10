require "test_helper"

class TwittsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twitts_index_url
    assert_response :success
  end
end
