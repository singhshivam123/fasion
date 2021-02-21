class AddProductColorToOrderProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_products, :product_color, index: true
    add_reference :order_products, :product_size, index: true
  end
end
