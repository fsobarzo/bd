class Guest < ActiveRecord::Base
 belongs_to :instance

 def self.victim?
 	where(victim: true).first
 end
end
