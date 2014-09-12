class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      oldGroupInt = @user.groupInt_id
      oldIndInt = @user.individualInt_id

      updatingBoth = user_params[:groupInt_id] && user_params[:individualInt_id]

      if @user.update(user_params)
        if updatingBoth
        elsif user_params[:groupInt_id] && !user_params[:individualInt_id]
          newTime = GroupInt.find(@user.groupInt_id)
          newTime.user_id = @user.id
          newTime.save
          if oldGroupInt
            oldTime = GroupInt.find(oldGroupInt)
            oldTime.user_id = nil
            oldTime.save
          end
        else
          newTime2 = IndividualInt.find(@user.individualInt_id)
          newTime2.user_id = @user.id
          newTime2.save
          if oldIndInt
            oldTime2 = IndividualInt.find(oldIndInt)
            oldTime2.user_id = nil
            oldTime2.save
          end
        end

        format.html { redirect_to :back, notice: 'Time successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def lookup
    @user = User.find_by confirmation_code: params[:confirmation_code]
    if @user == nil
      flash[:notice] = "Error, your code was not found. Check your email and try again."
      render :home
    else
      session[:current_user] = @user.id
      if @user.status == "0"
        redirect_to "/users/zero"
      elsif @user.status == "1"
        redirect_to "/users/one" 
      elsif @user.status == "2"
        redirect_to "/users/two" 
      elsif @user.status == "3"
        redirect_to "/users/three" 
      elsif @user.status == "4"
        redirect_to "/users/four"  
      end
    end
    
  end

  def one
    if session[:current_user]
      @user = User.find(session[:current_user])
    end
  end

  def zero
    if session[:current_user]
      @user = User.find(session[:current_user])
    end
  end

  def two
    if session[:current_user]
      @user = User.find(session[:current_user])
      @selectedTime = GroupInt.find @user.groupInt_id
      @groupInts = GroupInt.all
      @nilCount = GroupInt.find_by user_id: nil
    end
  end

  def three
    if session[:current_user]
      @user = User.find(session[:current_user])
      @selectedTime = IndividualInt.find_by user_id: @user.id
      @individualInts = IndividualInt.all
      @nilCount = IndividualInt.find_by user_id: nil
    end

  end

  def four
    if session[:current_user]
      @user = User.find(session[:current_user])
    end
  end

  def home
    if session[:current_user]
      @user = User.find(session[:current_user])
    end
  end
  
  def logout
    reset_session
    flash[:notice] = "Logged out."
    redirect_to "/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :confirmation_code, :status, :groupInt_id, :individualInt_id)
    end


end
