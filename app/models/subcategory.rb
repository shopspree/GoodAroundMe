class Subcategory < ActiveRecord::Base

  has_many :post_subcategories, as: :categorizeable, dependent: :destroy
  has_many :posts, through: :post_subcategories

  belongs_to :category
  belongs_to :actor
  belongs_to :context

  attr_accessible :actor_id, :context_id, :category_id, :name, :posts_count

  validates :name, presence: true, uniqueness: { scope: [:context_id, :category_id] }
  validates :category_id, presence: true

  before_validation  :actor_context


  protected

  def actor_context
    if context_id.nil?
      self.context_id = self.actor.context_id unless actor.nil?
    end
  end
end
