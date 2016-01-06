module NycDataLoader
class IncidentFactory
	def get_from_record(record)
		return nil unless zip = get_zip(record)
		return nil unless complaint_type = record['complaint_type']
		return nil unless status = record['status']
		return nil unless street = get_street(record)
		incident = ::Incident.new
		incident.zip = zip
		incident.complaint_type = complaint_type
		incident.status = status
		incident.street = street

		incident
	end

	def get_zip(record)
		return record['incident_zip'] if record['incident_zip'].to_i > 0
		return record['school_zip'] if record['school_zip'].to_i > 0
		return nil
	end

	def get_street(record)
		return record['street_name'] if record['street_name']
		#remove house number eg 123 98th Street to 98th Street
		return record['incident_address'].gsub(/^\W/, '').gsub(/^[0-9]* /, '').gsub(/^\W/, '') if record['incident_address']
		if record['intersection_street_1'] && record['intersection_street_2']
		    return record['intersection_street_1'] + ' and ' + record['intersection_street_2']
	    end
		return nil
	end
end
end