class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, limit: 20
      t.string :address
      t.string :mobile, limit: 25
      t.string :email

      t.timestamps
    end
  end
end
