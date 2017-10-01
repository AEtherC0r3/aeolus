class NodesController < ApplicationController
  before_action :set_room
  before_action :set_node, only: [:show, :edit, :update, :destroy, :get_states]

  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
  end

  # GET /nodes/new
  def new
    @node = Node.new
  end

  # GET /nodes/1/edit
  def edit
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(node_params)
    @node.room = @room

    respond_to do |format|
      if @node.save
        format.html { redirect_to [@room, @node], notice: 'Node was successfully created.' }
        format.json { render :show, status: :created, location: [@room, @node] }
      else
        format.html { render :new }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nodes/1
  # PATCH/PUT /nodes/1.json
  def update
    respond_to do |format|
      if @node.update(node_params)
        format.html { redirect_to [@room, @node], notice: 'Node was successfully updated.' }
        format.json { render :show, status: :ok, location: [@room, @node] }
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node.destroy
    respond_to do |format|
      format.html { redirect_to nodes_url, notice: 'Node was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_states
    # If the node isn't loaded <=> the api key is invalid, return HTTP 403 Forbidden
    unless @node
      render layout: false, status: 403
    end

    render json: @node.compute_states
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_node
      if params[:api_key]
        @node = Node.find_by(api_key: params[:api_key])
      else
        @node = Node.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def node_params
      params.require(:node).permit(:capabilities, :api_key)
    end
end
