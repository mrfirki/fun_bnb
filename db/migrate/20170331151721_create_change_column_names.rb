class CreateChangeColumnNames < ActiveRecord::Migration[5.0]
  def change
  	rename_table :braintrees, :payments

  end
end
