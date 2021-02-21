class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :product_color, null: false, foreign_key: true
      t.references :product_size, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total

      t.timestamps
    end
  end
end
