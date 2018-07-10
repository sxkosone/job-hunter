class RemovePercentageFromJobApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_applications, :percentage
  end
end
