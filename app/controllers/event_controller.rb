class EventController < ApplicationController
    def index
        unless session[:user_id]
        	redirect_to(:controller => 'user', :action => 'new')
        end
    end

    def create
    	
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = "You signed up successfully"
            flash[:color]= "valid"
            redirect_to :controller=> 'pages', :action => 'home'
        else
            flash[:notice] = "Form is invalid"
            flash[:color]= "invalid"
            render 'index'
        end
        
  
     end
    def event_params
        params.require(:event).permit(:title, :eventDate, :eventTime, :venue, :eventType, :description)
    end

    
end
