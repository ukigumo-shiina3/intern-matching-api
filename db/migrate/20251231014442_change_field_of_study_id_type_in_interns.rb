class ChangeFieldOfStudyIdTypeInInterns < ActiveRecord::Migration[8.0]
  def change
    remove_column :interns, :field_of_study_id, :string
    add_reference :interns, :field_of_study, null: false, foreign_key: true
  end
end
