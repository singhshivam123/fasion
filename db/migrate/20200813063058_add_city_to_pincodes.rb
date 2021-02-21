class AddCityToPincodes < ActiveRecord::Migration[6.0]
  def change
    remove_column :pincodes, :area, :string
    add_column :pincodes, :city, :string
    add_column :pincodes, :country , :string
  end
end
