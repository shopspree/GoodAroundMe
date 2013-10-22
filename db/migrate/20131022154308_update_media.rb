class UpdateMedia < ActiveRecord::Migration
  def up
    add_column :media, :mediable_id, :integer
    add_column :media, :mediable_type, :string

    Media.all.each do |media|
      Photo.create(url: media.url_string, media: media) if media.media_type_id == 1
    end

  end

  def down
    remove_column :media, :mediable_id
    remove_column :media, :mediable_type
  end
end
