class User < ApplicationRecord
    has_secure_password
    has_many :job_applications
    has_many :jobs, through: :job_applications
    has_many :tasks
    has_many :events

    validates :username, uniqueness: { case_sensitive: false }
end
