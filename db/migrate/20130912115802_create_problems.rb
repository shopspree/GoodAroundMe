class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :area
      t.text :report

      t.timestamps
    end
  end
end
