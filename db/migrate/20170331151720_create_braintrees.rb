class CreateBraintrees < ActiveRecord::Migration[5.0]
  def change
  	create_table :braintrees do |t|
      t.references :reservation, index: true
      t.string :braintree_payment_id
      t.string :status
      t.string :fourdigit

      t.timestamps
  	end
  end
end