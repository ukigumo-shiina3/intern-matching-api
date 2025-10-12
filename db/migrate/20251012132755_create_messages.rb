class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.bigint :room_id, null: false
      t.uuid :intern_id, null: false
      t.uuid :company_id, null: false
      t.text :content, null: false
      t.datetime :read_at, null: false
      t.timestamps
    end
  end
end
