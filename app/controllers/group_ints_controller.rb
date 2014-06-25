class GroupIntsController < ApplicationController
  before_action :set_group_int, only: [:show, :edit, :update, :destroy]

  # GET /group_ints
  # GET /group_ints.json
  def index
    @group_ints = GroupInt.all
  end

  # GET /group_ints/1
  # GET /group_ints/1.json
  def show
  end

  # GET /group_ints/new
  def new
    @group_int = GroupInt.new
  end

  # GET /group_ints/1/edit
  def edit
  end

  # POST /group_ints
  # POST /group_ints.json
  def create
    @group_int = GroupInt.new(group_int_params)

    respond_to do |format|
      if @group_int.save
        format.html { redirect_to @group_int, notice: 'Group int was successfully created.' }
        format.json { render :show, status: :created, location: @group_int }
      else
        format.html { render :new }
        format.json { render json: @group_int.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_ints/1
  # PATCH/PUT /group_ints/1.json
  def update
    respond_to do |format|
      if @group_int.update(group_int_params)
        format.html { redirect_to @group_int, notice: 'Group int was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_int }
      else
        format.html { render :edit }
        format.json { render json: @group_int.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_ints/1
  # DELETE /group_ints/1.json
  def destroy
    @group_int.destroy
    respond_to do |format|
      format.html { redirect_to group_ints_url, notice: 'Group int was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_int
      @group_int = GroupInt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_int_params
      params.require(:group_int).permit(:location, :user_id, :dt)
    end
end
