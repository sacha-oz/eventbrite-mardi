class Event < ApplicationRecord
	validate :is_multiple_of_5?
	validate :is_in_the_past?
	validates :start_date,
		presence: true 
	validates :duration,
		presence: true
	validates :title,
		presence: true,
		length: { in: 1..140, wrong_length: "1 to 140 characters is allowed" }
	validates :description,
		presence: true,
		length: { in: 10..1000, wrong_length: "10 to 1000 characters is allowed" }
	validates :price,
		presence: true,
		numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
	validates :location,
		presence: true

	belongs_to :admin, class_name: "User" #au lieu de belongs_to :user
	has_many :attendances
	has_many :users, through: :attendances

	def is_multiple_of_5?
		unless self.duration%5 == 0
			errors.add(:duration, "multiple de 5") 
		end
	end

	def is_in_the_past?
		if self.start_date < Time.now 
			errors.add(:start_date, "ne doit pas être dans le passé") 
		end
	end
end
