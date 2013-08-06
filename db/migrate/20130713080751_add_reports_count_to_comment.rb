class AddReportsCountToComment < ActiveRecord::Migration
  def change
    add_column :comments, :reports_count, :integer, default: 0

    Comment.reset_column_information
    Comment.all.each do |comment|
      Comment.update_counters comment.id, reports_count: comment.inappropriate_reports.count
    end
  end
end
