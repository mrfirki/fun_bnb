class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :gender, :string
  	add_column :users, :country, :string
  	add_column :users, :passport_id, :string
  end
end
