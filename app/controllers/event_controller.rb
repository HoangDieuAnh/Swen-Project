class EventController < ApplicationController
    def index
        if !session[:user_id]
        	redirect_to(:controller => 'user', :action => 'new')
        else
            @event = Event.new
            3.times { @event.event_pictures.build }

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
        params.require(:event).permit(:title, :eventDate, :eventTime,
        :venue, :eventType, :description, event_pictures_attributes: [:event_id, :image])
    end
   



    
end
