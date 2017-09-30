class DataPointsController < ApplicationController
  before_action :set_room, except: [:create]
  before_action :set_data_point, only: [:show, :destroy]
  before_action :set_node, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  # GET /data_points
  # GET /data_points.json
  def index
    @data_points = DataPoint.all
  end

  # GET /data_points/1
  # GET /data_points/1.json
  def show
  end

  # POST /data_points
  # POST /data_points.json
  def create
    # If the node isn't loaded <=> the api key is invalid, return HTTP 403 Forbidden
    unless @node
      render layout: false, status: 403
    end

    @data_point = DataPoint.new(data_point_params)
    @data_point.node = @node
    @data_point.room = @node.room

    respond_to do |format|
      if @data_point.save
        format.html { redirect_to @data_point, notice: 'Data point was successfully created.' }
        format.json { render :show, status: :created, location: @data_point }
      else
        format.html { render :index }
        format.json { render json: @data_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_points/1
  # DELETE /data_points/1.json
  def destroy
    @data_point.destroy
    respond_to do |format|
      format.html { redirect_to data_points_url, notice: 'Data point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_data_point
      @data_point = DataPoint.find(params[:id])
    end

    # Load the node using the api_key
    def set_node
      @node = Node.find_by(api_key: params[:api_key])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_point_params
      params.require(:data_point).permit(:kind, :value)
    end
end
