class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url_string
      t.integer :post_id
      t.integer :media_type_id

      t.timestamps
    end
  end
end
