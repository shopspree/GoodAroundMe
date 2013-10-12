desc "This task is called by the Heroku scheduler add-on"
task import_facebook_posts: :environment do
  Rails.logger.info "<Scheduler.rake> Import Facebook posts started at #{Time.now}"
  FacebookPage.all.each do |facebook_page|
    FacebookJob.new(facebook_page.identifier).perform
  end
  Rails.logger.info "<Scheduler.rake> Import Facebook posts ended at #{Time.now}"
end