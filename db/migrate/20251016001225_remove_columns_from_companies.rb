class RemoveColumnsFromCompanies < ActiveRecord::Migration[8.0]
  def change
    remove_column :companies, :title, :string
    remove_column :companies, :web_url, :string
    remove_column :companies, :intern_conditions, :text
    remove_column :companies, :is_published, :boolean
  end
end
