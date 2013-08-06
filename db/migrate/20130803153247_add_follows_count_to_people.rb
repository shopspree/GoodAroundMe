class AddFollowsCountToPeople < ActiveRecord::Migration
  def change
    add_column :people, :follows_count, :integer, default: 0

    Person.reset_column_information
    Person.all.each do |person|
      Person.update_counters person.id, follows_count: person.follows.count
    end
  end
end
