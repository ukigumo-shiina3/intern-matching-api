class RemoveUniqueIndexFromInterns < ActiveRecord::Migration[8.0]
  def change
    remove_index :interns, column: [ :field_of_study_id, :school_year_id ], name: "index_interns_on_field_of_study_id_and_school_year_id"
  end
end
