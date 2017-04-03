class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	has_many :payments

	def overlap?(reservation,booking)
  		(reservation.check_in - booking.check_out) * (booking.check_in - reservation.check_out) > 0
	end

	def overlaps_date(bookings)
		bookings.each do |x|
			return true if overlap?(self,x)
		end
		return false
	end		

	def check_max_guests
	    max_guests = listing.maximum_guests
	    return if guest_count < max_guests
	    errors.add(:max_guests, "Max guests number exceeded!")
  	end

	
end	