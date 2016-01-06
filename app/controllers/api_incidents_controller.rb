class ApiIncidentsController < BaseApiController
	def search
		valid_keys = []
		keys = ["complaint_type", "status", "street", "zip"]
		keys.each do |key|
			valid_keys.push(key) if !params[key].nil? && !params[key].empty?
		end	

		return render json: [], status: :ok if valid_keys.empty?

        query = Incident.select(keys.join(','))

        if valid_keys.include? ("street")
        	query.where!("street LIKE ?", "%#{params['street']}%")
        	valid_keys -= ["street"]
        end

		valid_keys.each do |key|
			query.where!(key + "=?", params[key]) 
		end
		render json: query, status: :ok
	end

	def get_complaints_types
		render json: Incident.select("DISTINCT complaint_type").map{ |incident| incident.complaint_type }, status: :ok
	end

	def get_statuses
		render json: Incident.select("DISTINCT status").map{ |incident| incident.status }, status: :ok
	end
end