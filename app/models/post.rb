class Post < ActiveRecord::Base
  has_many :comments
  has_many :likes
  belongs_to :user
  validates :body, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  default_scope -> {order('created_at DESC')}

  def self.posts_from_users(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (?) OR user_id = ? ", followed_user_ids, user)
  end
end
