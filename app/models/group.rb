class Group < ActiveRecord::Base
  has_many :associations
  has_many :people, through: :associations
  has_many :audiences, as: :audienceable
  has_one :actor, as: :actorable

  belongs_to :group_type
  belongs_to :context

  attr_accessible :group_type, :name, :context_id

  validates :name, presence: true
  validates :context_id, presence: true

end
