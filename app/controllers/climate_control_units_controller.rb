class ClimateControlUnitsController < ApplicationController
  before_action :set_room
  before_action :set_climate_control_unit, only: [:show, :edit, :update, :destroy]

  # GET /climate_control_units
  # GET /climate_control_units.json
  def index
    @climate_control_units = ClimateControlUnit.all
  end

  # GET /climate_control_units/1
  # GET /climate_control_units/1.json
  def show
  end

  # GET /climate_control_units/new
  def new
    @climate_control_unit = ClimateControlUnit.new
  end

  # GET /climate_control_units/1/edit
  def edit
  end

  # POST /climate_control_units
  # POST /climate_control_units.json
  def create
    @climate_control_unit = ClimateControlUnit.new(climate_control_unit_params)

    respond_to do |format|
      if @climate_control_unit.save
        format.html { redirect_to @climate_control_unit, notice: 'Climate control unit was successfully created.' }
        format.json { render :show, status: :created, location: @climate_control_unit }
      else
        format.html { render :new }
        format.json { render json: @climate_control_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climate_control_units/1
  # PATCH/PUT /climate_control_units/1.json
  def update
    respond_to do |format|
      if @climate_control_unit.update(climate_control_unit_params)
        format.html { redirect_to @climate_control_unit, notice: 'Climate control unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @climate_control_unit }
      else
        format.html { render :edit }
        format.json { render json: @climate_control_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climate_control_units/1
  # DELETE /climate_control_units/1.json
  def destroy
    @climate_control_unit.destroy
    respond_to do |format|
      format.html { redirect_to climate_control_units_url, notice: 'Climate control unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_climate_control_unit
      @climate_control_unit = ClimateControlUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def climate_control_unit_params
      params.require(:climate_control_unit).permit(:name, :kind, :room_id, :slot_id)
    end
end
