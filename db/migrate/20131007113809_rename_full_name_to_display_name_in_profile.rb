class RenameFullNameToDisplayNameInProfile < ActiveRecord::Migration
  def up
    rename_column :profiles, :full_name, :display_name
  end

  def down
    rename_column :profiles, :display_name, :full_name
  end
end
