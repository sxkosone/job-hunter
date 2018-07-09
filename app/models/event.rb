class Event < ApplicationRecord
  belongs_to :user
  belongs_to :job_application, optional: true
end
