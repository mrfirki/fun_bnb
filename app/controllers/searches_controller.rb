class SearchesController < ApplicationController

	def new
		@search = Search.new
		@place	= Listing.uniq.pluck(:place)
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end
	
	def show
		@search = Search.find(params[:id])
	end

	private

	def search_params
		params.required(:search).permit(:name, :place, :home_type)
	end		
end
