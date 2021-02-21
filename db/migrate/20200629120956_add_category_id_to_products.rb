class AddCategoryIdToProducts < ActiveRecord::Migration[6.0]
  def change
   add_column :products, :description, :text
   add_column :products, :mrp, :decimal
   add_column :products, :discount, :decimal
   add_column :products, :discount_type, :string
  end
end
