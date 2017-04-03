class ReservationsController < ApplicationController

	def new
		# @user = find_user
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end
	
	def index
		# @user = User.find(params[:user_id])
		if params[:user_id]
			@reservations = Reservation.where(user_id: params[:user_id])
		else
			@reservations = Reservation.where(listing_id: params[:listing_id])
		end
	end

	def show
		@payment = Payment.new
		@reservation = Reservation.find(params[:id])
	end	

	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(datepicker_reservation_params)
		@reservation.listing_id = @listing.id
		byebug
		@reservation.total_price = @listing.price * (@reservation.check_out - @reservation.check_in)
		byebug
		if !@reservation.overlaps_date(@listing.reservations)
			byebug
			if @reservation.save
				redirect_to listing_reservations_path
			else
				render "new"
			end
		else
			flash[:error] = "sorry reservation failed!!"
				render "new"
		end			 
	end

	def edit	
		@reservation = Reservation.find(params[:id])
	end

	def update		
		@reservation = Reservation.find(params[:id])
		if @reservation.update(reservation_params)
			flash[:succes] = "yey update success!!"
			redirect_to @reservation
		else
			flash[:error] = "sorry mate update fail!!"
			render :edit
		end		
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to user_reservations_path(find_user)
	end

	private
	
	def reservation_params
		params.required(:reservation).permit(:guest_count, :check_in, :check_out)
	end

	def datepicker_reservation_params
		parameters = reservation_params
		parameters[:check_in] = Date.strptime(parameters[:check_in], "%m/%d/%Y")
		parameters[:check_out] = Date.strptime(parameters[:check_out], "%m/%d/%Y")
		parameters
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_reservation
		@reservation = current_user.reservations.find(params[:id])
	end 	
end
