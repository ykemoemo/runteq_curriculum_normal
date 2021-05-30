class QwertToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :qwert, :users
  end
end
