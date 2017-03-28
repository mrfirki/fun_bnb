class CreateAddAnotherColumnsListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :availability_from, :date
  	add_column :listings, :availability_to, :date
  end
end
