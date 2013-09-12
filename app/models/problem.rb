class Problem < ActiveRecord::Base

  belongs_to :actor

  attr_accessible :area, :report, :actor_id, :screenshot_url
end
