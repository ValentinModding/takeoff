class ParticipationsController < ApplicationController
  before_action :set_parcicipation, only: [:destroy]

  def new
    @participation = Participation.new
  end

  def create
    @participation = Participation.new(participation_params)
    if @parcicipation.save
      redirect_to activity_path(@participation)
    else
      :new
    end
  end

  # def index
  #   @parcicipations = Participation.all
  # end

  def edit
  end

  def update
    @parcicipation.update(participation_params)
  end

  def destroy
    @participation.destroy
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:parcicipation).permit(:start, :end, :user_id, :activity_id, :contact_id)
  end
end
