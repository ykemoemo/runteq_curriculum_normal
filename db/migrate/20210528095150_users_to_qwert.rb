class UsersToQwert < ActiveRecord::Migration[5.2]
  def change
    rename_table :Users, :qwert
  end
end
