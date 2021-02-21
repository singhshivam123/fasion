class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, limit: 100
      t.references :state, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
