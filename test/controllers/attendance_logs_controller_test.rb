require "test_helper"

class AttendanceLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendance_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get attendance_logs_show_url
    assert_response :success
  end

  test "should get new" do
    get attendance_logs_new_url
    assert_response :success
  end

  test "should get edit" do
    get attendance_logs_edit_url
    assert_response :success
  end

  test "should get create" do
    get attendance_logs_create_url
    assert_response :success
  end

  test "should get update" do
    get attendance_logs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get attendance_logs_destroy_url
    assert_response :success
  end
end
