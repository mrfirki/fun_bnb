class CreateAddColumnListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :name, :string
  	add_column :listings, :adress, :string
  	add_column :listings, :home_type, :string
  	add_column :listings, :room_type, :string
  	add_column :listings, :place, :string
  	add_column :listings, :price, :integer
  	add_column :listings, :maximum_guests, :integer
  	add_reference :listings, :user, index: true, foreign_key: true
  end
end
