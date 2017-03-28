class ListingsController < ApplicationController
	# before_action :find_user, only: [:destroy]
  	before_action :find_listing, only: [:show, :edit, :update, :destroy]

	def new
		# @listing = current_user.listings.new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listings_params)
		# @listing = Listing.new(listings_params)
		# @listing.user_id = current_user.id
		if @listing.save
			redirect_to @listing
		else
			render "new"
		end		
	end

	def index
		@listings = Listing.all
	end

	def show
		@listing = Listing.find(params[:id])
	end	

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find_by(params[:id])
		if @listing.update(listing_params)
			flash[:success] = "successfully updated listing"
			redirect_to @listing
		else
			flash[:danger] = "sorry try again"
			render :edit	
		end	
	end

	def delete
		@listing = Listing.find_by(params[:id])
		@listing.destroy
		redirect_to user_listing_url(current_user)
	end

	private

	def listings_params
		params.required(:listing).permit(:name, :adress, :home_type, :room_type, :place, :price, :maximum_guests, :availability_from, :availability_to, {:avatars => []})		
	end	

	def find_user
    	@user = User.find(params[:user_id])
  	end

  	def find_listing
    	@listing = current_user.listings.find(params[:id])
  	end

end
