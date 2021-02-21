class AddCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :category, index: true
  end
end
