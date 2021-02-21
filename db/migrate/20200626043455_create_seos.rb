class CreateSeos < ActiveRecord::Migration[6.0]
  def change
    create_table :seos do |t|
      t.string :url
      t.string :title
      t.string :keyword
      t.string :discription

      t.timestamps
    end
  end
end
