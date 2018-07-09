class AddCityToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :city, :string
  end
end
