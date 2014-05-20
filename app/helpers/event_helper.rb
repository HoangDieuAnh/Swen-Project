module EventHelper
	def setup_event(event)
    1.times { event.event_pictures.build }
    event
  end
end
