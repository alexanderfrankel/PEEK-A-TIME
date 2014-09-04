class Event < ActiveRecord::Base
	validates :title, presence: :true
	validates :location, presence: :true
	validates :start_range, presence: :true
	validates :end_range, presence: :true

	has_many :days
end