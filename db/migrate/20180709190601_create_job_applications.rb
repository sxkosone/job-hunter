class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.integer :percentage
      t.string :status
      t.belongs_to :job, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
