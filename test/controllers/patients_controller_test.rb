require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should search patient" do
    get buscar_url('No exists')
    assert_redirected_to root_url
  end

  test "should search and redirect to patient when found" do
    existing_patient = Patient.create(
      identification: "1234567890",
      name: "John Doe",
      height: 1.75,
      mass: 70,
      systolic_pressure: 120,
      diastolic_pressure: 80
    )
  
    get buscar_url(parametro: existing_patient.identification)
  
    assert_response :success
    assert_template 'show'
    assert_equal existing_patient, assigns(:patient)
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference("Patient.count") do
      post patients_url, params: {
        patient: {
          identification: "1234567890",
          name: "John Doe",
          height: 1.75,
          mass: 70,
          systolic_pressure: 120,
          diastolic_pressure: 80
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
