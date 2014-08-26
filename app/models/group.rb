class Group < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :groupposts

  validates :name, presence: true
  validates :goal, presence: true
  validates :description, presence: true
end
