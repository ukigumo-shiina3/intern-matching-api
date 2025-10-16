class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.uuid :intern_id, null: false
      t.bigint :job_id, null: false
      t.string :current_status, default: "応募済み", null: false

      t.timestamps
    end
  end
end
