class CreateSocialProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :social_profiles do |t|
      t.string :provider, limit: 20
      t.string :url
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
