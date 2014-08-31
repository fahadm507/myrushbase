class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true
  validates :group_id, presence: true

  def self.is_member?(user, group)
    Membership.where(user_id: user.id, group_id: group.id).exists?
  end
end
