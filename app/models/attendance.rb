class Attendance < ApplicationRecord
	after_create :participate_send
	belongs_to :user
	belongs_to :event

	def participate_send
		
		UserMailer.participate_email(self).deliver_now
	end


end
