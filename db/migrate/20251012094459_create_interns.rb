class CreateInterns < ActiveRecord::Migration[8.0]
  def change
    create_table :interns, id: :uuid do |t|
      t.string :firebase_uid, null: false
      t.string :field_of_study_id, null: false
      t.string :school_year_id, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :school_name, null: false
      t.string :major_name, null: false

      t.timestamps
    end

      add_index :interns, :firebase_uid, unique: true
      add_index :interns, :field_of_study_id
      add_index :interns, :school_year_id
      add_index :interns, [ :field_of_study_id, :school_year_id ], unique: true
  end
end
