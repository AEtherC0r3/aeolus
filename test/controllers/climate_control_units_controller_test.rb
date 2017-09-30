require 'test_helper'

class ClimateControlUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @climate_control_unit = climate_control_units(:one)
  end

  test "should get index" do
    get climate_control_units_url
    assert_response :success
  end

  test "should get new" do
    get new_climate_control_unit_url
    assert_response :success
  end

  test "should create climate_control_unit" do
    assert_difference('ClimateControlUnit.count') do
      post climate_control_units_url, params: { climate_control_unit: { name: @climate_control_unit.name, room_id: @climate_control_unit.room_id, slot_id: @climate_control_unit.slot_id, type: @climate_control_unit.type } }
    end

    assert_redirected_to climate_control_unit_url(ClimateControlUnit.last)
  end

  test "should show climate_control_unit" do
    get climate_control_unit_url(@climate_control_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_climate_control_unit_url(@climate_control_unit)
    assert_response :success
  end

  test "should update climate_control_unit" do
    patch climate_control_unit_url(@climate_control_unit), params: { climate_control_unit: { name: @climate_control_unit.name, room_id: @climate_control_unit.room_id, slot_id: @climate_control_unit.slot_id, type: @climate_control_unit.type } }
    assert_redirected_to climate_control_unit_url(@climate_control_unit)
  end

  test "should destroy climate_control_unit" do
    assert_difference('ClimateControlUnit.count', -1) do
      delete climate_control_unit_url(@climate_control_unit)
    end

    assert_redirected_to climate_control_units_url
  end
end
