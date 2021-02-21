class CreatePincodes < ActiveRecord::Migration[6.0]
  def change
    create_table :pincodes do |t|
      t.integer :pincode
      t.string :location
      t.string :area

      t.timestamps
    end
  end
end
