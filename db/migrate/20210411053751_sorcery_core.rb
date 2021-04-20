class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :Users do |t|
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt
      t.string :last_name         
      t.string :first_name        

      t.timestamps                null: false
    end
    add_index :Users, :email, unique: true
  end
end
