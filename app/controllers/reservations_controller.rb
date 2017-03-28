class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end
	
	def index 
		@reservations = Reservation.all
	end

	def show
		@listings = Listing.all
		@reservation = Reservation.find(params[:id])
	end	

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			redirect_to reservations_path
		else
			render "new"
		end		 
	end

	def edit

	end

	def update

	end

	def delete

	end

	private
	
	def reservation_params
		params.required(:reservation).permit(:guest_count, :check_in, :check_out)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_reservation
		@reservation = current_user.reservations.find(params[:id])
	end 	
end
