require "test_helper"

class PatientTest < ActiveSupport::TestCase

  test "calcularIndiceMasaCorporal calculates BMI correctly" do
    patient = Patient.new(mass: 70, height: 1.75)
    result = patient.calcularIndiceMasaCorporal
    expected_result = 70 / (1.75 * 1.75)
    assert_in_delta expected_result, result
  end

  test "calcularMasaMaximaNormal calculates maximum normal mass correctly" do
    patient = Patient.new(height: 1.75)
    result = patient.calcularMasaMaximaNormal
    expected_result = 25 * (1.75 * 1.75)
    assert_in_delta expected_result, result
  end

  test "calcularCategoriaPresionArterial calculates blood pressure category correctly" do
    patient = Patient.new(systolic_pressure: 120, diastolic_pressure: 80)
    result = patient.calcularCategoriaPresionArterial
    assert_equal "Hipertensión", result
  end

  test "calcularCategoriaMasaCorporal calculates BMI category correctly" do
    patient = Patient.new(height: 1.75, mass: 105)
    patient_result = patient.calcularCategoriaMasaCorporal
    result = patient.calcularCategoriaMasaCorporal
    assert_equal "Obesidad", result
  end
end
