class CostumersController < ApplicationController
  before_action :set_costumer, only: %i[ show edit update destroy ]

  # GET /costumers or /costumers.json
  def index
    @costumers = Costumer.all
  end

  # GET /costumers/1 or /costumers/1.json
  def show
  end

  # GET /costumers/new
  def new
    @costumer = Costumer.new
  end

  # GET /costumers/1/edit
  def edit
  end

  # POST /costumers or /costumers.json
  def create
    @costumer = Costumer.new(costumer_params)

    respond_to do |format|
      if @costumer.save
        format.html { redirect_to costumer_url(@costumer), notice: "Costumer was successfully created." }
        format.json { render :show, status: :created, location: @costumer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costumers/1 or /costumers/1.json
  def update
    respond_to do |format|
      if @costumer.update(costumer_params)
        format.html { redirect_to costumer_url(@costumer), notice: "Costumer was successfully updated." }
        format.json { render :show, status: :ok, location: @costumer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costumers/1 or /costumers/1.json
  def destroy
    @costumer.destroy

    respond_to do |format|
      format.html { redirect_to costumers_url, notice: "Costumer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costumer_params
      params.require(:costumer).permit(:name, :email)
    end
end
