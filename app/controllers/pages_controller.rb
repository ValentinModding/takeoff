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

  def profile
    @user = current_user
    @my_contacts = []
    @contacts = Contact.where(user: current_user)
    # @contacts.select do |contact|
    #   contact.user_id = current_user.id
    #   @my_contacts << contact
    # end
  end

  def pres
  end

end
