class Api::V1::MeasurementsController < ApplicationController
  before_action :set_measurement, only: %i[show update destroy]
  before_action :find_intake, only: [:create]
  # GET /measurements
  def index
    @measurements = current_user.measurements.all

    render json: @measurements
  end

  # GET /measurements/1
  def show
    render json: @measurement
  end

  # POST /measurements
  def create
    @measurement = @intake.measurements.build(measurement_params)
    @measurement.user_id = current_user.id
    if @measurement.save
      render json: @measurement, status: :created
    else
      render json: @measurement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /measurements/1
  def update
    if @measurement.update(measurement_params)
      render json: @measurement
    else
      render json: @measurement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /measurements/1
  def destroy
    @measurement.destroy
    response = { message: 'Measurement deleted successfully' }
    render json: response
  end

  private

  def find_intake
    @intake = Intake.find(params[:intake_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_measurement
    @intake = Intake.find(params[:intake_id])
    @measurement = @intake.measurements.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def measurement_params
    params.permit(:units)
  end
end
