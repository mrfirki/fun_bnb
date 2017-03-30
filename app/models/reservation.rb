class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	def overlap?(reservation,booking)
  		(reservation.check_in - booking.check_out) * (booking.check_in - reservation.check_out) > 0
	end

	def overlaps_date(bookings)
		bookings.each do |x|
			return true if overlap?(self,x)
		end
		return false
	end		

end	