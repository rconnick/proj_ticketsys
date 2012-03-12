class Ticket < ActiveRecord::Base
	validates :user, :presence => true
	validates :description, :presence => true
	validates :opened_at, :presence => true
	
end
