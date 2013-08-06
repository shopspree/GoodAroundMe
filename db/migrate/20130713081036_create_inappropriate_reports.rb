class CreateInappropriateReports < ActiveRecord::Migration
  def change
    create_table :inappropriate_reports do |t|
      t.integer :reportable_id
      t.string :reportable_type
      t.string :report_type
      t.integer :actor_id

      t.timestamps
    end
  end
end
