class Event < ActiveRecord::Base
	has_many :event_pictures, dependent: :destroy
		accepts_nested_attributes_for :event_pictures,:reject_if => proc {|attributes|
    attributes.all? {|k,v| v.blank?}
  }

	validates :title, :presence=>true
    validates :venue, :presence => true
    validates :eventDate, :presence => true #password_confirmation attr

    def pictures_for_event
        3.times { self.event_pictures.build }
       
     end

end

  