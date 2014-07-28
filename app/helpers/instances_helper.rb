module InstancesHelper

	def can?

		if detective_signed_in?
			if current_detective.id.to_i == params[:detective_id].to_i
				return true
			else
				return false
			end
		else admin_signed_in?
			return true
		end
	end

	def close?(id)
		i = Instance.find(id)
		i.state
	end
end
