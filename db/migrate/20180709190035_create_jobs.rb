class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :description
      t.date :posted_date

      t.timestamps
    end
  end
end
