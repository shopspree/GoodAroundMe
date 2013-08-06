class RenameReportsCountColumn < ActiveRecord::Migration
  def up
    rename_column :posts, :reports_count, :inappropriate_reports_count
    rename_column :comments, :reports_count, :inappropriate_reports_count
  end

  def down
    rename_column :posts, :inappropriate_reports_count, :reports_count
    rename_column :comments, :inappropriate_reports_count, :reports_count
  end
end
