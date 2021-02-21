class AddFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :string
    add_column :users, :location, :string
    add_column :users, :city, :string
    add_column :users, :country , :string
    add_column :users, :pincode, :integer
  end
end
