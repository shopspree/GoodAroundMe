class AddAboutToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :about, :string
  end
end
