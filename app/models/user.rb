class User < ApplicationRecord
    has_secure_password
    has_many :job_applications
    has_many :jobs, through: :job_applications
    has_many :tasks
    has_many :events

    validates :username, uniqueness: { case_sensitive: false }

    def applications_by_status
        #will return a hash of job applications by status and their occurrences
        statuses = self.job_applications.map do |application|
            application.status
        end
        statuses.each_with_object(Hash.new(0)) do |item, hash|
            hash[item] += 1
        end
    end

    def past_events
        self.events.count do |event|
            event.date.past?()
        end
    end

    
end
