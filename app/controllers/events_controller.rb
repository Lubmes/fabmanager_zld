class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_machines, only: [:new, :create, :edit, :update]

  def events
    client = Signet::OAuth2::Client.new({
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
    })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event_list = service.list_events(params[:calendar_id])
  end

  def new_event
  client = Signet::OAuth2::Client.new({
    client_id: Rails.application.secrets.google_client_id,
    client_secret: Rails.application.secrets.google_client_secret,
    token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
  })

  client.update!(session[:authorization])

  service = Google::Apis::CalendarV3::CalendarService.new
  service.authorization = client

  today = Date.today

  event = Google::Apis::CalendarV3::Event.new({
    start: Google::Apis::CalendarV3::EventDateTime.new(date: today),
    end: Google::Apis::CalendarV3::EventDateTime.new(date: today + 1),
    summary: 'New event!'
  })

  service.insert_event(params[:calendar_id], event)

  redirect_to events_url(calendar_id: params[:calendar_id])
end

  def redirect
    client = Signet::OAuth2::Client.new({
                                            client_id: Rails.application.secrets.google_client_id,
                                            client_secret: Rails.application.secrets.google_client_secret,
                                            authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
                                            scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
                                            redirect_uri: callback_url
                                        })

    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new({
                                            client_id: Rails.application.secrets.google_client_id,
                                            client_secret: Rails.application.secrets.google_client_secret,
                                            token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
                                            redirect_uri: callback_url,
                                            code: params[:code]
                                        })

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to calendars_url
  end

  def calendars
    client = Signet::OAuth2::Client.new({
                                            client_id: Rails.application.secrets.google_client_id,
                                            client_secret: Rails.application.secrets.google_client_secret,
                                            token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
                                        })

    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
  end


  # GET /events
  # GET /events.json
  def index
    @events = Event.all.where(approved: true)
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  def approved

  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @user = current_user
    @event = Event.new(event_params)
    authorize @event

    @event.approved = current_user.admin? ? true : false

    respond_to do |format|
      if @event.save

        if current_user.admin?
          format.html { redirect_to event_url(@event), notice: 'Uw evenement is aangemaakt.' }
          format.json { render :show, status: :created, location: @event }
        else
          EventsMailer.event_email(@user, @event).deliver!
          EventsMailer.event_email_admin(@user, @event).deliver!
          format.html { redirect_to @event, notice: 'Uw verzoek word bekeken.' }
          format.json { render :show, status: :created, location: @event }
        end

      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)

        if current_user.admin?
          format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
          format.json { render :show, status: :ok, location: @event }

        else
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        end

      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      flash[:notice] = "succesvol bijgewerkt."

      if current_user.admin?
        format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :machine_ids => [])
    end

  def set_machines
    @machines = Machine.all
  end

  end
