class CreateMunicipalities < ActiveRecord::Migration[8.0]
  def change
    create_table :municipalities do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :municipalities, [ :prefecture_id, :name ], unique: true
  end
end
