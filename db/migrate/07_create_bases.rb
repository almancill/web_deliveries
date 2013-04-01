class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.decimal :amount, null: false
      t.text :description
      t.references :motorcycle, null: false

      t.timestamps
    end
    add_index :bases, :motorcycle_id
  end
end
