class Instance < ActiveRecord::Base
	has_and_belongs_to_many :places
	has_and_belongs_to_many :weapons
	belongs_to :detective
	has_many :guests
	has_many :evidences
	has_many :notes
end
