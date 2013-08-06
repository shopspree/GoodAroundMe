class InappropriateReport < ActiveRecord::Base

  belongs_to :reportable, polymorphic: true, counter_cache: true
  belongs_to :actor

  attr_accessible :report_type, :reportable_id, :reportable_type, :actor_id

  #validates :actor_id, presence: true, uniqueness: { scope: [:reportable_id, :reportable_type] }
  validates :reportable_id, presence: true
  validates :reportable_type, presence: true

  def post
    case reportable
      when Post
        reportable
      when Comment
        comment = reportable
        comment.post
      else
        nil
    end
  end

end
