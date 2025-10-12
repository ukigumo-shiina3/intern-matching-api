class CreateSchoolYears < ActiveRecord::Migration[8.0]
  def change
    create_table :school_years do |t|
      t.uuid :intern_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
