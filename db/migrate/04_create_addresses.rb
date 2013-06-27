class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :customer, null: false
      t.string :value, null: false

      t.timestamps
    end
    add_index :addresses, :customer_id
  end
end
