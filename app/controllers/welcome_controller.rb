class WelcomeController < ApplicationController
  def index
  	@counter ||= 0 unless @counter
		if params[:value]
			@counter+= params[:value].to_i
			@listings = Listing.all.limit(5).offset(@counter)
		else
			@listings = Listing.all.limit(5).offset(0)
		end	
  end
end
