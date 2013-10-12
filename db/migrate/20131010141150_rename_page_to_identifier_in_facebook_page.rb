class RenamePageToIdentifierInFacebookPage < ActiveRecord::Migration
  def up
    rename_column :facebook_pages, :page, :identifier
  end

  def down
    rename_column :facebook_pages, :identifier, :page
  end
end
