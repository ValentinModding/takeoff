class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :get_participations, only: [:show, :index]

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
    @activities = Activity.all.order("date_time_start ASC")
    @user = current_user
    @markers = @activities.map do |activity|
      {
        lat: activity.spot.latitude,
        lng: activity.spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { activity: activity }),
        image_url: helpers.asset_url("logo-surfapp.png")
      }
    end
    if params[:query].present?
      @activities = Activity.search(params[:query])
    else
      @activities
    end
  end

  def show
    @wetsuit = ""
    wetsuits = ["Shorty", "3/2", "4/3", "5/4"]
    if @activity.water_temp < 12
      @wetsuit = wetsuits[3]
    elsif @activity.water_temp > 12 && @activity.water_temp < 17
      @wetsuit = wetsuits[2]
    elsif @activity.water_temp > 17 && @activity.water_temp < 22
      @wetsuit = wetsuits[1]
    else
      @wetsuit = wetsuits[0]
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

  def get_participations
    @participations = Participation.includes(:user).where(activity: @activity)
  end
end
