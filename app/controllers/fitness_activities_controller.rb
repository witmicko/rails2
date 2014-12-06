class FitnessActivitiesController < ApplicationController
  before_action :set_fitness_activity, only: [:show, :edit, :update, :destroy]

  # GET /fitness_activities
  # GET /fitness_activities.json
  def index
    @fitness_activities = FitnessActivity.all
  end

  # GET /fitness_activities/1
  # GET /fitness_activities/1.json
  def show
  end

  # GET /fitness_activities/new
  def new
    @fitness_activity = FitnessActivity.new
  end

  # GET /fitness_activities/1/edit
  def edit
  end

  # POST /fitness_activities
  # POST /fitness_activities.json
  def create
    @fitness_activity = FitnessActivity.new(fitness_activity_params)
    @fitness_activity.user = current_user
    respond_to do |format|
      if @fitness_activity.save
        format.html { redirect_to @current_user, notice: 'Fitness activity was successfully created.' }
        format.json { render :show, status: :created, location: @fitness_activity }
      else
        format.html { render :new }
        format.json { render json: @fitness_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness_activities/1
  # PATCH/PUT /fitness_activities/1.json
  def update
    respond_to do |format|
      if @fitness_activity.update(fitness_activity_params)
        format.html { redirect_to @fitness_activity, notice: 'Fitness activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @fitness_activity }
      else
        format.html { render :edit }
        format.json { render json: @fitness_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness_activities/1
  # DELETE /fitness_activities/1.json
  def destroy
    @fitness_activity.destroy
    respond_to do |format|
      format.html { redirect_to fitness_activities_url, notice: 'Fitness activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_activity
      @fitness_activity = FitnessActivity.where(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fitness_activity_params
      params.require(:fitness_activity).permit(:note, :photo, :act_type, :distance, :heart_rate, :calories, :duration)
    end
end
