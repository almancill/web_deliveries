class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :address
      t.text :description
      t.text :note
      t.decimal :delivery_cost
      t.decimal :invoice_cost
      t.integer :invoice_number

      t.timestamps
    end
    add_index :deliveries, :address_id
  end
end
