class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    
    change_column(:users, :username, :string, unique: true)
    change_column(:users, :password, :string, unique: true)
  end
end
