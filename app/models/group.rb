class Group < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :memberships
  has_many :groupposts
  has_many :memberships
  has_many :groupfollowers

  validates :name, presence: true
  validates :goal, presence: true
  validates :description, presence: true
end
