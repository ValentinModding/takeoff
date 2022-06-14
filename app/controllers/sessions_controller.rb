class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def edit
    @session.update(session_params)
  end

  def destroy
    @session.destroy
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:wave_height, :wind, :period, :wind_direction, :wave_direction, :min_score, :date_time_start, :date_time_end, :tips, :photo, :spot )
  end
end
