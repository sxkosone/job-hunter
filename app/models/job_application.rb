class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :tasks
  has_many :events

  @@STATUS = ["started", "submitted", "interviewing", "heard back", "completed", "deleted"]
  
  def self.status
    @@STATUS
  end

  def completion_percentage
    all_tasks = self.tasks
    (all_tasks.count {|task| task.done == true}.to_f / all_tasks.length * 100).round
  end
end
