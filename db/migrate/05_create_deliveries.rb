class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :address, null: false
      t.text :description, null: false
      t.text :note
      t.references :motorcycle, null: false
      t.decimal :delivery_cost, null: false
      t.decimal :invoice_cost
      t.integer :invoice_number

      t.timestamps
    end
    add_index :deliveries, :address_id
  end
end
