class ChangeCaptionToTextInPost < ActiveRecord::Migration
  def up
    change_column :posts, :caption, :text
  end

  def down
    change_column :posts, :caption, :text
  end
end
