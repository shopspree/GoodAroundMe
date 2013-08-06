class AddThumbnailUrlStringToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :thumbnail_url_string, :string
  end
end
