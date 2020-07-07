class IntakesController < ApplicationController
  before_action :set_intake, only: [:show, :update, :destroy]

  # GET /intakes
  def index
    @intakes = Intake.all

    render json: @intakes
  end

  # GET /intakes/1
  def show
    render json: @intake
  end

  # POST /intakes
  def create
    @intake = Intake.new(intake_params)

    if @intake.save
      render json: @intake, status: :created
    else
      render json: @intake.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /intakes/1
  def update
    if @intake.update(intake_params)
      render json: @intake, status: :updated
    else
      render json: @intake.errors, status: :unprocessable_entity
    end
  end

  # DELETE /intakes/1
  def destroy
    @intake.destroy
    response = { message:'Intake category successfully deleted'}
    render json: response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intake
      @intake = Intake.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def intake_params
      params.permit(:title)
    end
end
