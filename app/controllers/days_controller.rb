class DaysController < ApplicationController
	before_action :set_event, only: [:create, :destroy, :upvote, :downvote]
	before_action :set_day, only: [:upvote, :downvote]

	def new
		@day = Day.new
	end

	def create
		@day = Day.new(day_params)
		@day.event = @event
		if @day.save
			flash[:notice] = "Your dates have been saved. NICE/."
			redirect_to event_path(@event)
		else
			flash[:alert] = "nope. wrong again. sry mwahahaha ########"
			redirect_to new_event_day_path(@event)
		end
	end

	def destroy
		@day = Day.find(params[:id])
		@day.destroy
		flash[:notice] = "NOO YOU HAVE FINALLY DELETED ME FROM EXISTANCE!!!!"
		redirect_to event_path(@event)
	end

	def upvote
		@day.upvote
		render json: {day_id: @day.id, new_score: @day.score}
	end

	def downvote
		@day.downvote
		render json: {day_id: @day.id, new_score: @day.score}
	end

	private

	def day_params
		params.require(:day).permit(:start_day, :end_day)
	end

	def set_event
		@event = Event.find(params[:event_id])
	end

	def set_day
		@day = Day.find(params[:day_id])
	end

end