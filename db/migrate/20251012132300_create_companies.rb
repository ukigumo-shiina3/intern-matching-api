class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :firebase_uid, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :address_line, null: false
      t.string :title, null: false
      t.string :web_url, null: false
      t.text :intern_conditions, null: false
      t.boolean :is_published, null: false
      t.timestamps
    end
  end
end
