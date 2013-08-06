class AddEmailToJobProfile < ActiveRecord::Migration
  def change
    add_column :job_profiles, :email, :string
  end
end
