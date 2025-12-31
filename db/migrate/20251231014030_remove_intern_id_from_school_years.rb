class RemoveInternIdFromSchoolYears < ActiveRecord::Migration[8.0]
  def change
    remove_column :school_years, :intern_id, :uuid, null: false
  end
end
