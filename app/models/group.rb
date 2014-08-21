class Group < ActiveRecord::Base
  belongs_to :user
  has_many :users

  validates :name, presence: true
  validates :goal, presence: true
  validates :description, presence: true
end
