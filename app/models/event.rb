class Event < ActiveRecord::Base
	validates :title, :presence=>true
    validates :venue, :presence => true
    validates :eventDate, :presence => true #password_confirmation attr
end
