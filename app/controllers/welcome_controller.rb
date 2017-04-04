class WelcomeController < ApplicationController

  def index
   	if params[:page]
   		@listings = Listing.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
 	 else	 	
	  	if params[:search]
	  		@listings = Listing.where(["name LIKE ?", "#{params[:search]}"]).paginate(page: params[:page], per_page: 2)
	  	else
	  		@listings = Listing.order("created_at DESC").paginate(page: params[:page], per_page: 2)
	  	end
	 end  	
  end

end
