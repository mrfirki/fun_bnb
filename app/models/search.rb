class Search < ApplicationRecord

	def search_listings
		listings = Listing.all

		listings = listings.where(["name LIKE ?", "#{name}"]) if name.present?
		listings = listings.where(["place LIKE ?", "#{place}"]) if place.present?
		listings = listings.where(["home_type LIKE ?", "#{home_type}"]) if home_type.present?

		return listings
	end	
end
