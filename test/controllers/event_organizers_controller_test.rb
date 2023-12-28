require "test_helper"

class EventOrganizersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_organizers_create_url
    assert_response :success
  end

  test "should get show" do
    get event_organizers_show_url
    assert_response :success
  end

  test "should get update" do
    get event_organizers_update_url
    assert_response :success
  end

  test "should get delete" do
    get event_organizers_delete_url
    assert_response :success
  end
end
