class AddThemeToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :theme, :string
  end
end
