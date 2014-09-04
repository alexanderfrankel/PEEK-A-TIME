class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "Your event has been created! Good job. You know how to fill out a form ;)"
			redirect_to event_path(@event)
		else
			flash[:alert] = "Your event has not been created gosh danggit!"
			redirect_to new_event_path
		end
	end

	def show
		@days = @event.days
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:notice] = "Event has been successfully updated. Duh Duh Duh Dummmm!!!"
			redirect_to event_path
		else
			flash[:notice] = "Try again ya idiot (no hard feelings)"
			render "edit"
		end
	end

	def destroy
		@event.destroy
		flash[:notice] = "Kiss your event bye-bye :("
		redirect_to root_path
	end

	private

	def event_params
		params.require(:event).permit(:title, :location, :start_range, :end_range)
	end

	def set_event
		@event = Event.find(params[:id])
	end
end