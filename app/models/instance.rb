class Instance < ActiveRecord::Base
	has_and_belongs_to_many :places
	has_and_belongs_to_many :weapons
	has_one :detective
end
