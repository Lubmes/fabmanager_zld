module GoogleAPI

private

def add_to_google(event)
client = Signet::OAuth2::Client.new({
                                        client_id: Rails.application.secrets.google_client_id,
                                        client_secret: Rails.application.secrets.google_client_secret,
                                        token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
                                    })

client.update!(session[:authorization])

service = Google::Apis::CalendarV3::CalendarService.new
service.authorization = client

event = Google::Apis::CalendarV3::Event.new({
                                                start: Google::Apis::CalendarV3::EventDateTime.new(date: @event.start_time),
                                                end: Google::Apis::CalendarV3::EventDateTime.new(date: @event.end_time),
                                                summary: @event.title
                                            })

service.insert_event(params[:calendar_id], event)

redirect_to events_url(calendar_id: params[:calendar_id])

end

end
