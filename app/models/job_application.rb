class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :tasks
  has_many :events

  @@STATUS = ["started", "submitted", "interviewing", "heard back", "completed", "deleted"]
  
  def self.status
    @@STATUS
  end
end
