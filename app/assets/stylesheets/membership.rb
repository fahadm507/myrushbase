class Membership < ActiveRecord::Base
  belongs_to :user
  belong_to :group

  validates :user_id, presence: true
  validates :group_id, presence: true

  def is_member?(user, group)
    Membership.find(user_id: user.id, group_id: group.id).exists
  end
end
