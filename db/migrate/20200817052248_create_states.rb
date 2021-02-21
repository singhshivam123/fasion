class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name, limit: 100
      t.references :country, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
