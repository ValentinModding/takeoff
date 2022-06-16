class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def new
    @activity = Activity.new
    @spots = Spot.all
    @flags = ["Green", "Yellow", "red"]
  end

  def create
    @activity = Activity.new(activity_params)
    if activity.save
      redirect_to activity_path(@activity)
    else
      :new
    end
  end

  def index
    @activities = Activity.all
    @user = current_user
    # @participations = Participation.where(:session_id)
  end

  def show
  end

  def edit
  end

  def update
    @activity.update(activity_params)
  end

  def destroy
    @activity.destroy
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:wave_height, :wind, :period, :wind_direction, :wave_direction, :min_score, :date_time_start, :date_time_end, :tips, :photo, :spot )
  end
end