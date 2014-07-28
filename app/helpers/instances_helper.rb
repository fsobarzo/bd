module InstancesHelper

	def can?
		if current_detective.id.to_i == params[:detective_id].to_i
			return true
		else
			return false
		end
	end

	def close?(id)
		i = Instance.find(id)
		i.state
	end
end
