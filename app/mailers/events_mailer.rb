class EventsMailer < ApplicationMailer
  default from: "Fabmanagerzeeland@gmail.com"

  def event_email(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: 'Huur verzoek aangemaakt.')
  end

  def event_email_admin(user, event)
    @user = user
    @event = event
    mail(to: "Fablabzeeland@gmail.com", subject: 'Een nieuw huur verzoek is aangemaakt.')
  end

  def event_approve_email(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: 'Huur verzoek is geaccepteerd.')
  end

  def user_register(user)
    @user = user
    mail(to: @user.email, subject: 'Succesvol geregistreerd')
  end
end
