class ParticipationsController < ApplicationController
  before_action :set_activity, only: [:new, :create]
  before_action :set_participation, only: [:destroy]

  def new
    @user = current_user
    @participation = Participation.new
    @contacts = Contact.where(user: current_user)
    # authorize @participation
  end

  def create
    @participation = Participation.new(participation_params)
    # @participation.activity = @activity
    @participation.user = current_user
    if @participation.save!
      redirect_to dashboard_path
    else
      :new
    end
    # authorize @participation
  end

  # def index
  #   @participations = Participation.all
  # end

  def edit
    # authorize @participation
  end

  def update
    @participation.update(participation_params)
  end

  def destroy
    @participation.user = current_user
    @participation.destroy
    redirect_to dashboard_path
    # authorize @participation
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def participation_params
    params.require(:participation).permit(:start, :end, :user_id, :activity_id, :contact_id)
  end
end
