class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  
    def index
      @events = Event.all
      @previous_events = Event.previous
      @upcoming_events = Event.upcoming
    end
  
  
    def show
    end
  
    def new
      @event = Event.new
    end
  
  
    def edit
    end
  
  
    def create
    @event = current_user.created_events.build(event_params) 

      respond_to do |format|
        if @event.save
          format.html { redirect_to event_path(@event), notice: 'event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
    def destroy
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      
      def set_event
        @event = Event.find(params[:id])
      end
  
      def event_params
        params.require(:event).permit(:title, :location, :event_date, attendee_ids: [])
      end
  end
  