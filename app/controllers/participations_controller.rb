require 'twilio-ruby'

class ParticipationsController < ApplicationController
  before_action :set_activity, only: [:new, :create, :show, :completed]
  before_action :set_participation, only: [:destroy, :completed]

  def new
    @user = current_user
    @participation = Participation.new
    @participation.start = @activity.date_time_start
    @participation.end = @activity.date_time_end
    @contacts = Contact.where(user: current_user)
    # authorize @participation
  end

  def send_sms_to_contact
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      body: "#{@participation.user.name} surf le #{@participation.activity.date_time_start.strftime("%d/%m/%Y")}
de #{@participation.start.strftime("%Hh%M")}
à #{@participation.end.strftime("%Hh%M")}
à #{@participation.activity.spot.name}
avec #{@activity.participations_count} buddies",
      from: '+19032824020',
      to: "+33#{@participation.contact.tel}}"
    )
  end

  def sms_rappel
    @user = current_user
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      body: "#{@participation.contact.name} est prévenu de ton départ en session. Pense à le prévenir quand tu seras rentrée. Bon surf !",
      from: '+19032824020',
      to: "+33#{@user.tel}}"
    )
  end


  def send_sms_back
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
      body: "#{@participation.user.name} est bien rentrée de sa session",
      from: '+19032824020',
      to: "+33#{@participation.contact.tel}}"
    )

  end

  def sms_confirmation
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
      body: "#{@participation.contact.name} a bien été prévenu de ton retour de session",
      from: '+19032824020',
      to: "+33#{@user.tel}}"
    )
  end

  def create
    @participation = Participation.new(participation_params)
    @participation.activity = @activity
    @participation.user = current_user
    if @participation.save!
      send_sms_to_contact
      sms_rappel
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
    @participation.update(participation_params)
  end

  def destroy
    @participation.user = current_user
    @participation.destroy
    redirect_to dashboard_path
    # authorize @participation
  end

  def completed
    @participation.completed = !@participation.completed
    @participation.save
    redirect_to dashboard_path
  end

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
