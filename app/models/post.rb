class Post < ActiveRecord::Base

  has_many :medias, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :mentions, as: :mentionable, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :hashtags, through: :tags
  has_many :inappropriate_reports, as: :reportable, dependent: :destroy
  has_many :post_subcategories, dependent: :destroy
  has_many :subcategories, through: :post_subcategories
  has_many :notifications, as: :notificationable, dependent: :destroy
  has_one :activity, as: :timelineable, dependent: :destroy
  has_one :audience, as: :audienceable, dependent: :destroy

  belongs_to :actor, counter_cache: true
  belongs_to :contributor, class_name: "Actor"

  #accepts_nested_attributes_for :medias

  attr_accessible :actor_id, :contributor_id, :comments_count, :likes_count, :title, :caption, :inappropriate_reports_count, :post_subcategories_count

  scope :popular, lambda { where("created_at > ?", 60.days.ago) }


  def title
    read_attribute(:title).try(:titleize)
  end

  def is_liked_by?(actor)
    likes.each do |like|
      return true if like.actor == actor
    end

    false
  end

end
