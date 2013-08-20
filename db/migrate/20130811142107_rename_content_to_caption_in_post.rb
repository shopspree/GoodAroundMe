class RenameContentToCaptionInPost < ActiveRecord::Migration
  def up
    rename_column :posts, :content, :caption
  end

  def down
    rename_column :posts, :caption, :content
  end
end
