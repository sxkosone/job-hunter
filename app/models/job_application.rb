class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user

  @@STATUS = ["started", "submitted", "interviewing", "heard back", "completed", "deleted"]
  
  def self.status
    @@STATUS
  end
end
