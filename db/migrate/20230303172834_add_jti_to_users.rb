class AddJtiToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jti, :string, null: false
    add_index :users, :jti, unique: true
    # https://github.com/DakotaLMartinez/rails-devise-jwt-tutorial#set-up-a-revocation-strategy
  end
end
