class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, limit: 100
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
