class AddFullNameToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :full_name, :string
  end
end
