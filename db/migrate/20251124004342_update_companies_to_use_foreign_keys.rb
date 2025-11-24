class UpdateCompaniesToUseForeignKeys < ActiveRecord::Migration[8.0]
  def change
    add_reference :companies, :prefecture, null: false, foreign_key: true
    add_reference :companies, :municipality, null: false, foreign_key: true

    remove_column :companies, :prefecture, :string
    remove_column :companies, :municipality, :string
  end
end
