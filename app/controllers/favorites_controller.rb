class FavoritesController < ApplicationController
  def index
   @favorites = current_user.activities
  end

  def toggle_favorite
    @activity = Activity.find(params[:activity_id])
    favoris = current_user.favorite_for(@activity)

    if favoris
      favoris.destroy
    else
      Favorite.create!(user: current_user, activity: @activity)
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/favoris', locals: {activity: @activity}, formats: [:html] }
    end
  end
end
