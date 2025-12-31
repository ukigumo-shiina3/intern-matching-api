class RemoveInternIdFromFieldOfStudies < ActiveRecord::Migration[8.0]
  def change
    remove_column :field_of_studies, :intern_id, :uuid, null: false
  end
end
