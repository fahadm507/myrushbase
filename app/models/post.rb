class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :body, presence: true
  validates :user_id, presence: true
end
