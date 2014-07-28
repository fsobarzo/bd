class Weapon < ActiveRecord::Base
	has_and_belongs_to_many :instances

	def self.percent_weapon
		
	end
end
