class RoomController < ApplicationController
	def index
		@room = Room.all
	end

	def new

		@room = Room.new
	end

	def show
		@room = Room.find(params[:id])
	end

	def edit
		@room = Room.find(params[:id])
	end

	def destroy 
		@room = Room.find(params[:id])
		@room.destroy

		redirect_to rooms_path		
	end

	private
		def room_params
			params.require(:room).permit(:name)
		end

end
