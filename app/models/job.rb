class Job < ApplicationRecord
    has_many :job_applications
    

    def snippet
        self.description[0..100] + "..."
    end


end
