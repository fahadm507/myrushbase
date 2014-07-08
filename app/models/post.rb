class Post < ActiveRecord::Base
  has_many :comments
  has_many :likes
  belongs_to :user
  validates :body, presence: true
  validates :user_id, presence: true
end
