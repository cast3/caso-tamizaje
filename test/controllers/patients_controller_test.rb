require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:patient)
  end

  test "should search patient" do
    get buscar_url('No exists')
    assert_redirected_to root_url
  end

  test "should search and redirect to patient when found" do
    get buscar_url(parametro: @patient.identification)

    assert_response :success
    assert_template 'show'
    assert_equal @patient, assigns(:patient)
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference("Patient.count") do
      post patients_url, params: {
        patient: {
          identification: @patient.identification,
          name: @patient.name,
          height: @patient.height,
          mass: @patient.mass,
          systolic_pressure: @patient.systolic_pressure,
          diastolic_pressure: @patient.diastolic_pressure
        }
      }
    end
    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

end
