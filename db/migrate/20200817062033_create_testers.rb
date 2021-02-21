class CreateTesters < ActiveRecord::Migration[6.0]
  def change
    create_table :testers do |t|
      t.string :country, limit: 100
      t.string :city, limit: 100
      t.string :state, limit: 100

      t.timestamps
    end
  end
end
