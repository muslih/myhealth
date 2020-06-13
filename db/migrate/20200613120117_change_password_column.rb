class ChangePasswordColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :passwqord_digest, :password_digest
  end
end
