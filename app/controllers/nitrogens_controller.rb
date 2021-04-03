class NitrogensController < ApplicationController
  before_action :set_nitrogen, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /nitrogens or /nitrogens.json
  def index
    @nitrogens = Nitrogen.all
  end

  # GET /nitrogens/1 or /nitrogens/1.json
  def show
  end

  # GET /nitrogens/new
  def new
    #@nitrogen = Nitrogen.new
    @nitrogen = current_user.nitrogens.build
  end

  # GET /nitrogens/1/edit
  def edit
  end

  # POST /nitrogens or /nitrogens.json
  def create
    #@nitrogen = Nitrogen.new(nitrogen_params)
    @nitrogen = current_user.nitrogens.build(nitrogen_params)

    respond_to do |format|
      if @nitrogen.save
        format.html { redirect_to @nitrogen, notice: "Nitrogen was successfully created." }
        format.json { render :show, status: :created, location: @nitrogen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nitrogen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nitrogens/1 or /nitrogens/1.json
  def update
    respond_to do |format|
      if @nitrogen.update(nitrogen_params)
        format.html { redirect_to @nitrogen, notice: "Nitrogen was successfully updated." }
        format.json { render :show, status: :ok, location: @nitrogen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nitrogen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nitrogens/1 or /nitrogens/1.json
  def destroy
    @nitrogen.destroy
    respond_to do |format|
      format.html { redirect_to nitrogens_url, notice: "Nitrogen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @nitrogen = current_user.nitrogens.find_by(id: params[:id])
    redirect_to nitrogens_path, notice: "Not Authorized to edit other user's friends, you mad!" if @nitrogen.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nitrogen
      @nitrogen = Nitrogen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nitrogen_params
      params.require(:nitrogen).permit(:user_name, :email, :phone, :twitter, :user_id)
    end
end
