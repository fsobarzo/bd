class Guest < ActiveRecord::Base
 belongs_to :instance

 def self.victim?
 	where(victim: true).first
 end

 def self.not_victim
 	where(victim: false)
 end

 def self.sospechoso?
 	where(suspect: true).first
 end

end
