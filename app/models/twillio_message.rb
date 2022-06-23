class TwillioMessage
  def self.send_sms(content, phone_number)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
      body: content,
      from: '+12512577944',
      to: phone_number
    )
  end
end
