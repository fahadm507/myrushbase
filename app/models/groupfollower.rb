class Groupfollower < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def self.following?(user, group)
    Groupfollower.where(user_id:user.id, group_id: group.id).exists?
  end
end
