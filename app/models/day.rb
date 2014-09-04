class Day < ActiveRecord::Base
	validates :start_day, presence: :true
	validates :end_day, presence: :true

	belongs_to :event

	def upvote
		self.score += 1
		self.save
	end

	def downvote
		self.score -= 1
		self.save
	end
end