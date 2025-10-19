class RemoveColumnsFromInterns < ActiveRecord::Migration[8.0]
  def change
    remove_column :interns, :phone_number, :string
  end
end
