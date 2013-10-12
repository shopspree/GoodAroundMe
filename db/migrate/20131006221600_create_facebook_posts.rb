class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.string :facebook_run_id
      t.integer :post_id
      t.string :facebook_type
      t.string :facebook_object_id
      t.string :facebook_id
      t.datetime :facebook_created_time
      t.datetime :facebook_updated_time

      t.timestamps
    end
  end
end
