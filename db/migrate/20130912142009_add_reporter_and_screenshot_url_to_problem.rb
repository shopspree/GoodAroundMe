class AddReporterAndScreenshotUrlToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :reporter, :string
    add_column :problems, :screenshot_url, :string
  end
end
