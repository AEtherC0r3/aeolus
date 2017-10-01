class SlotsController < ApplicationController
  before_action :set_room
  before_action :set_node
  before_action :set_slot, only: [:show, :edit, :update, :destroy]
  before_action :set_climate_control_unit, only: [:create, :update]

  # GET /slots
  # GET /slots.json
  def index
    @slots = Slot.all
  end

  # GET /slots/1
  # GET /slots/1.json
  def show
  end

  # GET /slots/new
  def new
    @slot = Slot.new
  end

  # GET /slots/1/edit
  def edit
  end

  # POST /slots
  # POST /slots.json
  def create
    @slot = Slot.new(slot_params)
    @slot.node = @node
    @climate_control_unit.slot = @slot

    respond_to do |format|
      if @slot.save
        @climate_control_unit.save!
        format.html { redirect_to [@room, @node, @slot], notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: [@room, @node, @slot] }
      else
        format.html { render :new }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slots/1
  # PATCH/PUT /slots/1.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        @climate_control_unit.slot = @slot
        @climate_control_unit.save!
        format.html { redirect_to [@room, @node, @slot], notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: [@room, @node, @slot] }
      else
        format.html { render :edit }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slots/1
  # DELETE /slots/1.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to slots_url, notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_node
      @node = Node.find(params[:node_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_slot
      @slot = Slot.find(params[:id])
    end

    def set_climate_control_unit
      @climate_control_unit = ClimateControlUnit.find(params[:climate_control_unit_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slot_params
      params.require(:slot).permit(:identifier, :climate_control_unit_id)
    end
end
