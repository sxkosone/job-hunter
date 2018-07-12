require 'rss'
class Job < ApplicationRecord
    has_many :job_applications
    

    def snippet
        full_sanitizer = Rails::Html::FullSanitizer.new
        sanitized_description = full_sanitizer.sanitize(self.description)
        sanitized_description[0..240] + "..."
    end

    def self.job_feed(location_str)
        rss_results = []
        rss_posts = RSS::Parser.parse(open(Job.url_creator(location_str)).read, false).items[0..10]
        #Return array of job objects
        rss_posts.map {|post| self.job_generator(post)}
    end

    private

    def self.url_creator(location_str)
        location_str = location_str.gsub(/\s+/,'%2c+')
        "https://stackoverflow.com/jobs/feed?location=#{location_str}"
    end

    def self.job_generator(rss_post)
        new_job = Job.new
        new_job.description = rss_post.description
        new_job.url = rss_post.link
        parsed_job_title = job_title_parser(rss_post.title)
        new_job.position = parsed_job_title[:position]
        new_job.company = parsed_job_title[:company]
        new_job.city = parsed_job_title[:city]
        new_job.posted_date = rss_post.pubDate
        new_job
    end

    def self.job_title_parser(rss_title_str)
        str_arr = rss_title_str.split(' at ', 2)
        {position: str_arr[0], company: str_arr[1].split(' (')[0], city: str_arr[1].split(' (')[1].chop}
    end

end
