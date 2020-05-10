require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get follow" do
    get relationships_follow_url
    assert_response :success
  end

  test "should get follower" do
    get relationships_follower_url
    assert_response :success
  end

  test "should get create" do
    get relationships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get relationships_destroy_url
    assert_response :success
  end

end
