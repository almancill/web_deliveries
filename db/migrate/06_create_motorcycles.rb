class CreateMotorcycles < ActiveRecord::Migration
  def change
    create_table :motorcycles do |t|
      t.string :name, null: false
      t.string :messenger_name, null: false
      t.text :description

      t.timestamps
    end
  end
end
