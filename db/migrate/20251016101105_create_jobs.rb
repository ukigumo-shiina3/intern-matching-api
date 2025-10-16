class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.uuid :company_id, null: false
      t.string :title, null: false
      t.string :web_url, null: false
      t.text :intern_conditions, null: false
      t.boolean :is_published, null: false

      t.timestamps
    end
  end
end
