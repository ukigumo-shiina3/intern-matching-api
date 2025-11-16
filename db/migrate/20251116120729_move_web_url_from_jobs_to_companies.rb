class MoveWebUrlFromJobsToCompanies < ActiveRecord::Migration[8.0]
  def change
    add_column :companies, :web_url, :string

    remove_column :jobs, :web_url, :string
  end
end
