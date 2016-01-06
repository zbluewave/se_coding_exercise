require 'json'
require File.expand_path('../../../models/incident', __FILE__)
require_relative 'incident_facotry'
require_relative 'json_string_stream_processor'

module NycDataLoader
class Loader
	def load_from_file(file_path)
		processor = JsonStringStreamProcessor.new
		factory = IncidentFactory.new
		File.open(file_path, "rb") { |file|
			while char = file.read(1)
				processor.add_char(char) do |record|
					incident = factory.get_from_record(record)
					incident.save if incident
				end 
			end
		}
	end
end
end
