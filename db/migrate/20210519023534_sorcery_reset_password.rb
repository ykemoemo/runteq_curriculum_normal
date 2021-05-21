class SorceryResetPassword < ActiveRecord::Migration[5.2]
  def down
    change_column :users, :reset_password_token, :string
    change_column :users, :reset_password_token_expires_at, :datetime
    change_column :users, :reset_password_email_sent_at, :datetime
  end
end
