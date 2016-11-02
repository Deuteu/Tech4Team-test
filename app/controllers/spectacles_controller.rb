class SpectaclesController < ApplicationController
  before_action :set_spectacle, only: [:show, :edit, :update, :destroy]

  # GET /spectacles
  # GET /spectacles.json
  def index
    @spectacles = Spectacle.all
  end

  # GET /spectacles/1
  # GET /spectacles/1.json
  def show
  end

  # GET /spectacles/new
  def new
    @spectacle = Spectacle.new
  end

  # GET /spectacles/1/edit
  def edit
  end

  # POST /spectacles
  # POST /spectacles.json
  def create
    @spectacle = Spectacle.new(spectacle_params)

    respond_to do |format|
      if @spectacle.save
        format.html { redirect_to @spectacle, notice: 'Spectacle was successfully created.' }
        format.json { render :show, status: :created, location: @spectacle }
      else
        format.html { render :new }
        format.json { render json: @spectacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spectacles/1
  # PATCH/PUT /spectacles/1.json
  def update
    respond_to do |format|
      if @spectacle.update(spectacle_params)
        format.html { redirect_to @spectacle, notice: 'Spectacle was successfully updated.' }
        format.json { render :show, status: :ok, location: @spectacle }
      else
        format.html { render :edit }
        format.json { render json: @spectacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spectacles/1
  # DELETE /spectacles/1.json
  def destroy
    @spectacle.destroy
    respond_to do |format|
      format.html { redirect_to spectacles_url, notice: 'Spectacle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spectacle
      @spectacle = Spectacle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spectacle_params
      params.require(:spectacle).permit(:cle, :name)
    end
end
