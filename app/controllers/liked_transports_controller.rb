class LikedTransportsController < ApplicationController
  before_action :set_liked_transport, only: [:show, :edit, :update, :destroy]

  # GET /liked_transports
  # GET /liked_transports.json
  def index
    @liked_transports = LikedTransport.all
  end

  # GET /liked_transports/1
  # GET /liked_transports/1.json
  def show
  end

  # GET /liked_transports/new
  def new
    @liked_transport = LikedTransport.new
  end

  # GET /liked_transports/1/edit
  def edit
  end

  # POST /liked_transports
  # POST /liked_transports.json
  def create
    @liked_transport = LikedTransport.new(liked_transport_params)

    respond_to do |format|
      if @liked_transport.save
        format.html { redirect_to @liked_transport, notice: 'Liked transport was successfully created.' }
        format.json { render :show, status: :created, location: @liked_transport }
      else
        format.html { render :new }
        format.json { render json: @liked_transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liked_transports/1
  # PATCH/PUT /liked_transports/1.json
  def update
    respond_to do |format|
      if @liked_transport.update(liked_transport_params)
        format.html { redirect_to @liked_transport, notice: 'Liked transport was successfully updated.' }
        format.json { render :show, status: :ok, location: @liked_transport }
      else
        format.html { render :edit }
        format.json { render json: @liked_transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liked_transports/1
  # DELETE /liked_transports/1.json
  def destroy
    @liked_transport.destroy
    respond_to do |format|
      format.html { redirect_to liked_transports_url, notice: 'Liked transport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked_transport
      @liked_transport = LikedTransport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liked_transport_params
      params.require(:liked_transport).permit(:user_id, :transport_id)
    end
end
