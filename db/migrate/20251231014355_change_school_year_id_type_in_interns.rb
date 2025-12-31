class ChangeSchoolYearIdTypeInInterns < ActiveRecord::Migration[8.0]
  def change
    remove_column :interns, :school_year_id, :string
    add_reference :interns, :school_year, null: false, foreign_key: true
  end
end
