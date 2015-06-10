class WorkoutsController < ApplicationController

	before_action :find_workout, only: [:show, :edit, :update, :destroy]

	def index
		@workouts = Workout.all.order("created_at DESC")
	end

	def show
	end

	def new
		@workout = Workout.new
	end

	def create
		@workout = Workout.create!(workout_params)
		if @workout.save
			redirect_to @workout, notice: "Successfully created new workout!"
		else
			render 'new'
		end
	end

	def edit
		#@workout
	end

	def update
	end

	def destroy
		@workout.destroy
		redirect_to root_path
	end

	private

	def workout_params
		params.require(:workout).permit(:title, :date, :mood, :length)
	end

	def find_workout
		@workout = Workout.find(params[:id])
	end

end
