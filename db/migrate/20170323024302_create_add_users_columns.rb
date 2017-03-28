class CreateAddUsersColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :add_users_columns do |t|
    	t.string :gender
    	t.string :country
    	t.string :passport_id

      t.timestamps
    end
  end
end
