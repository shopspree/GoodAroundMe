class RenameThumbnailUrlStringToPictureThumbnailUrlInProfile < ActiveRecord::Migration
  def up
    rename_column :profiles, :thumbnail_url_string, :picture_thumbnail_url
  end

  def down
    rename_column :profiles, :picture_thumbnail_url, :thumbnail_url_string
  end
end
