class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @my_future_participations = []
    @participations = Participation.all
    @participations.select do |participation|
      participation.user_id = current_user.id
      @my_future_participations << participation
    end
  end
end
