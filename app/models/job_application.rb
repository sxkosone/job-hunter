class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :tasks
  has_many :events

  @@STATUS = ["started", "completed", "submitted", "interviewing for"]
  
  def self.status
    @@STATUS
  end

  def completion_percentage
    all_tasks = self.tasks
    all_tasks.empty? ? 0 :(all_tasks.count {|task| task.done == true}.to_f / all_tasks.length * 100).round
  end
end
