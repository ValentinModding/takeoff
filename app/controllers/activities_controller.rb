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
    @markers = @activities.map do |activity|
      {
        lat: activity.spot.latitude,
        lng: activity.spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { activity: activity }),
        image_url: helpers.asset_url("TAKE OFF 2.png")
      }
    end
  end

  def show
    @participations = Participation.includes(:user).where(activity: @activity)
    @wetsuit = ""
    wetsuits = ["Shorty", "3/2", "4/3", "5/4"]
    if @activity.water_temp > 24
      @wetsuit = wetsuits[0]
    elsif @activity.water_temp < 24 && @activity.water_temp > 17
      @wetsuit = wetsuits[1]
    elsif @activity.water_temp < 17 && @activity.water_temp > 12
      @wetsuit = wetsuits[2]
    else
      @wetsuit = wetsuits[3]
    end
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
