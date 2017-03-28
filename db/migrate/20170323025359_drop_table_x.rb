class DropTableX < ActiveRecord::Migration[5.0]
  def change
  	drop_table :add_users_columns
  end
end
