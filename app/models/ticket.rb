class Ticket < ActiveRecord::Base
	validates :user_id, :presence => true
	validates :description, :presence => true
	validates :opened_at, :presence => true
	
end
