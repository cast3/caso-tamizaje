class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show ]

  def buscar
    @parametro = params[:parametro]
    @patient = Patient.find_by(identification: @parametro)

    if @patient
      render 'show'
    else
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
        format.html { redirect_to patient_url(@patient) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
