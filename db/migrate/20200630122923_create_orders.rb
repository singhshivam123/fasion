class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :payment_id
      t.string :payment_mode
      t.datetime :date
      t.decimal :subtotal
      t.decimal :discount
      t.string :discount_type
      t.decimal :total

      t.timestamps
    end
  end
end
