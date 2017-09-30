require 'test_helper'

class DataPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_point = data_points(:one)
  end

  test "should get index" do
    get data_points_url
    assert_response :success
  end

  test "should get new" do
    get new_data_point_url
    assert_response :success
  end

  test "should create data_point" do
    assert_difference('DataPoint.count') do
      post data_points_url, params: { data_point: { node_id: @data_point.node_id, room_id: @data_point.room_id, type: @data_point.type, value: @data_point.value } }
    end

    assert_redirected_to data_point_url(DataPoint.last)
  end

  test "should show data_point" do
    get data_point_url(@data_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_point_url(@data_point)
    assert_response :success
  end

  test "should update data_point" do
    patch data_point_url(@data_point), params: { data_point: { node_id: @data_point.node_id, room_id: @data_point.room_id, type: @data_point.type, value: @data_point.value } }
    assert_redirected_to data_point_url(@data_point)
  end

  test "should destroy data_point" do
    assert_difference('DataPoint.count', -1) do
      delete data_point_url(@data_point)
    end

    assert_redirected_to data_points_url
  end
end
