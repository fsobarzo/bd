class Guest < ActiveRecord::Base
 belongs_to :instance

 def self.victim?
 	where(victim: true).first
 end

 def self.not_victim
 	where(victim: false)
 end

 def self.victim_and_me(id)
 	where("guests.victim = 'false' OR guests.id = '#{id}'")
 end
end
