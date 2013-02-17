class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, null: false  
      t.string :username, null: false
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end