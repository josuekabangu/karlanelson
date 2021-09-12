require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
    @appointment = appointments(:one)
  end

  test "should get index" do
    get :index, params: { service_id: @service }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { service_id: @service }
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post :create, params: { service_id: @service, appointment: @appointment.attributes }
    end

    assert_redirected_to service_appointment_path(@service, Appointment.last)
  end

  test "should show appointment" do
    get :show, params: { service_id: @service, id: @appointment }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { service_id: @service, id: @appointment }
    assert_response :success
  end

  test "should update appointment" do
    put :update, params: { service_id: @service, id: @appointment, appointment: @appointment.attributes }
    assert_redirected_to service_appointment_path(@service, Appointment.last)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, params: { service_id: @service, id: @appointment }
    end

    assert_redirected_to service_appointments_path(@service)
  end
end
