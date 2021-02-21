class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :mrp
      t.decimal :discount
      t.string :discount_type
      t.decimal :price

      t.timestamps
    end
  end
end
