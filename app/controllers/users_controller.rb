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
    @user_activities = Activity.desc(:created_at).where(user: params[:id])
    puts
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
        sign_in @user
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
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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

  def follow
    other_user = User.find_by(id: params[:format])
    if current_user.follow!(other_user)
      redirect_to root_path, :flash => {notice: "Followed #{other_user.first_name} #{other_user.last_name}"}
    else
      redirect_to root_path, :flash => { notice: "something went wrong" }
    end
  end

  def unfollow
    other_user = User.find_by(id: params[:format])
    if current_user.unfollow!(other_user)
      redirect_to root_path, :flash => { :notice => "Unfollowed #{other_user.first_name} #{other_user.last_name}" }
    else
      redirect_to root_path, :flash => { :notice => "something went wrong" }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :date_of_birth,
                                 :email,
                                 :gender,
                                 :athlete_type,
                                 :password,
                                 :password_confirmation)
  end
end
