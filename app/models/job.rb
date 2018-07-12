class Job < ApplicationRecord
    has_many :job_applications
    

    def snippet
        self.description[0..100] + "..."
    end

    def self.job_feed
        rss_results = []
        rss = RSS::Parser.parse(open("https://stackoverflow.com/jobs/feed?location=sydney").read, false).items
    end

end
