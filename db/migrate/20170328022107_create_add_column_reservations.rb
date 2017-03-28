class CreateAddColumnReservations < ActiveRecord::Migration[5.0]
  def change
	add_column :reservations, :guest_count, :integer
	add_reference :reservations, :user, foreign_key: true
	add_reference :reservations, :listing, foreign_key: true  
 	add_column :reservations, :check_in, :date
 	add_column :reservations, :check_out, :date
  end
end
