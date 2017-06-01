class EventsMailer < ApplicationMailer
  default from: "Fabmanagerzeeland@gmail.com"

  def sample_email(user, event)
    @user = user
    @event = event
    mail(to: 'liamahk@live.nl', subject: 'Huur verzoek aangemaakt.')
  end

  def register_email(user)
    @user = user
    mail(to: 'liamahk@live.nl', subject: 'Succesvol geregistreerd')
  end
end
