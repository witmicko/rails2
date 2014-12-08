class StrengthActivitiesController < ApplicationController
  before_action :set_strength_activity, only: [:show, :edit, :update, :destroy]

  # GET /strength_activities
  # GET /strength_activities.json
  def index
    @strength_activities = StrengthActivity.desc(:created_at).where(user: params[:id] )
  end

  # GET /strength_activities/1
  # GET /strength_activities/1.json
  def show
  end

  # GET /strength_activities/new
  def new
    @strength_activity = StrengthActivity.new
  end

  # GET /strength_activities/1/edit
  def edit
    @strength_activity = current_user.activities.find_by(id: params[:id])
  end

  # POST /strength_activities
  # POST /strength_activities.json
  def create
    @strength_activity = StrengthActivity.new(strength_activity_params)
    @strength_activity.user = current_user
    respond_to do |format|
      if @strength_activity.save
        format.html { redirect_to @current_user, notice: 'Strength activity was successfully created.' }
        format.json { render :show, status: :created, location: @strength_activity }
      else
        format.html { render :new }
        format.json { render json: @strength_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strength_activities/1
  # PATCH/PUT /strength_activities/1.json
  def update
    respond_to do |format|
      if @strength_activity.update(strength_activity_params)
        format.html { redirect_to @current_user, notice: 'Strength activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @strength_activity }
      else
        format.html { render :edit }
        format.json { render json: @strength_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strength_activities/1
  # DELETE /strength_activities/1.json
  def destroy
    @strength_activity.destroy
    respond_to do |format|
      format.html { redirect_to strength_activities_url, notice: 'Strength activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strength_activity
      @strength_activity = current_user.activities.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strength_activity_params
      params.require(:strength_activity).permit(:note,
                                                :photo,
                                                :act_type,
                                                :weight,
                                                :sets,
                                                :reps)
    end
end
