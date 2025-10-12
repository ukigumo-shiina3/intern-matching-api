class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.uuid :intern_id, null: false
      t.uuid :company_id, null: false
      t.timestamps
    end

    add_index :rooms, [ :intern_id, :company_id ], unique: true
  end
end
