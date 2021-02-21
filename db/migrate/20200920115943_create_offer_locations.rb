class CreateOfferLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_locations do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
