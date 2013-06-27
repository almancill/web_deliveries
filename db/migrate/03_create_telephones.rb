class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.references :customer, null: false
      t.integer :number, null: false

      t.timestamps
    end
    add_index :telephones, :customer_id
  end
end
