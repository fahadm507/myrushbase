class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true

  def self.has_liked?(user_id, post_id)
    like = Like.where(user_id: user_id, post_id: post_id)
    like.exists?
  end
end
