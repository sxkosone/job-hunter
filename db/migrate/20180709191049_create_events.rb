class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :address
      t.datetime :date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :job_application, foreign_key: true

      t.timestamps
    end
  end
end
