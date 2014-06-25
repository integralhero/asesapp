class IndividualIntsController < ApplicationController
  before_action :set_individual_int, only: [:show, :edit, :update, :destroy]

  # GET /individual_ints
  # GET /individual_ints.json
  def index
    @individual_ints = IndividualInt.all
  end

  # GET /individual_ints/1
  # GET /individual_ints/1.json
  def show
  end

  # GET /individual_ints/new
  def new
    @individual_int = IndividualInt.new
  end

  # GET /individual_ints/1/edit
  def edit
  end

  # POST /individual_ints
  # POST /individual_ints.json
  def create
    @individual_int = IndividualInt.new(individual_int_params)

    respond_to do |format|
      if @individual_int.save
        format.html { redirect_to @individual_int, notice: 'Individual int was successfully created.' }
        format.json { render :show, status: :created, location: @individual_int }
      else
        format.html { render :new }
        format.json { render json: @individual_int.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individual_ints/1
  # PATCH/PUT /individual_ints/1.json
  def update
    respond_to do |format|
      if @individual_int.update(individual_int_params)
        format.html { redirect_to @individual_int, notice: 'Individual int was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual_int }
      else
        format.html { render :edit }
        format.json { render json: @individual_int.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_ints/1
  # DELETE /individual_ints/1.json
  def destroy
    @individual_int.destroy
    respond_to do |format|
      format.html { redirect_to individual_ints_url, notice: 'Individual int was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_int
      @individual_int = IndividualInt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_int_params
      params.require(:individual_int).permit(:location, :user_id, :dt)
    end
end
