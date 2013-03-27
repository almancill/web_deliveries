class CreateMotorcycles < ActiveRecord::Migration
  def change
    create_table :motorcycles do |t|
      t.string :name
      t.string :messenger_name
      t.text :description

      t.timestamps
    end
  end
end
