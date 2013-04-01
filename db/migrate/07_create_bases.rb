class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.decimal :amount, null: false
      t.text :description
      t.references :motorcycles

      t.timestamps
    end
    add_index :bases, :motorcycles_id
  end
end
