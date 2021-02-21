class AddBrandIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :brand, index: true
  end
end
