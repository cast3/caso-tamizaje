class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show ]

  def index
    @patients = Patient.all
  end

  def buscar
    @parametro = params[:parametro]
    @patient = Patient.find_by(identification: @parametro)

    if @patient
      render 'show'
    else
      flash[:alert] = "No se encontró ningún resultado para '#{@parametro}'"
      redirect_to root_path
    end
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy!

    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully destroyed." }
    end
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:identification, :name, :height, :mass, :systolic_pressure, :diastolic_pressure)
    end
end
