class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.decimal :money_amount, null: false
      t.text :description
      t.references :motorcycle, null: false

      t.timestamps
    end
    add_index :amounts, :motorcycle_id
  end
end
