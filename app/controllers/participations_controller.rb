require 'twilio-ruby'

class ParticipationsController < ApplicationController
  before_action :set_activity, only: [:new, :create, :show, :update]
  before_action :set_participation, only: [:destroy, :update]

  def new
    @user = current_user
    @participation = Participation.new
    @participation.start = @activity.date_time_start
    @participation.end = @activity.date_time_end
    @contacts = Contact.where(user: current_user)
    # authorize @participation
  end

  def send_sms
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      body: "#{@participation.user.name} is surfing the #{@participation.activity.date_time_start.to_formatted_s(:short)}\n
from: #{@participation.start.to_formatted_s(:short)}\n
to #{@participation.end.to_formatted_s(:short)}\n
at #{@participation.activity.spot.name}\n
with #{@activity.participations_count} buddies",
      from: '+12512577944',
      to: "+33#{@participation.contact.tel}"
    )
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.activity = @activity
    @participation.user = current_user
    if @participation.save!
      # send_sms
      redirect_to activity_participation_path(@activity, @participation)
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
    @participation.status = true
    @user = current_user
    # @order.user = current_user
    @participation.save!
    redirect_to dashboard_path
  end

  def destroy
    @participation.user = current_user
    @participation.destroy
    redirect_to dashboard_path
    # authorize @participation
  end

  # def status
  #   @participation.status = !@participation.status
  #   @participation.save
  #   redirect_to dashboard_path
  # end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def participation_params
    params.require(:participation).permit(:start, :end, :user_id, :activity_id, :contact_id, :completed)
  end
end
