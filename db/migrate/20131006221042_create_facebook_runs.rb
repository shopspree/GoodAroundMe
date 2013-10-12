class CreateFacebookRuns < ActiveRecord::Migration
  def change
    create_table :facebook_runs do |t|
      t.integer :facebook_page_id
      t.string :url

      t.timestamps
    end
  end
end
