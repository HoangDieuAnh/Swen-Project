class EventController < ApplicationController
    def index
        if !session[:user_id]
        	redirect_to(:controller => 'users', :action => 'new')
        else
            @event = Event.new
            @event.event_pictures.build 
            @event.tickets.build
        end
    end
    

    
        
  
     
    def event_params
        params.require(:event).permit(:title, :eventDate, :eventTime,
        :venue, :eventType, :description, event_pictures_attributes: [:event_id, :picturename], tickets_attributes:[:event_id, :price, :startdate, :closedate, 
          :maxnumber, :description])
    end
   
def new
    if !session[:user_id]
        redirect_to :controller => 'users', :action => 'new'
    else
        session[:event_params] ||= {}
        @event = Event.new(session[:event_params])
        @event.event_pictures.build 
        @event.tickets.build
        @event.current_step = session[:event_step]
    end
end

def create
    session[:event_params].deep_merge!(event_params) if params[:event]
    @event = Event.new(session[:event_params])

    @event.current_step = session[:event_step]
    if @event.valid?
      if params[:back_button]
        @event.previous_step
      elsif @event.last_step?
        @event.save if @event.all_valid?
      else
        @event.next_step
      end
      session[:event_step] = @event.current_step
    end
    if @event.new_record?
        redirect_to :controller=> 'event', :action => 'new'

    else
      session[:event_step] = session[:event_params] = nil
      flash[:notice] = "Order saved!"
      redirect_to :controller=> 'pages', :action => 'home'
    end
  
end
    
end
