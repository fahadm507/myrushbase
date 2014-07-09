class Point < ActiveRecord::Base
  belongs_to :user

  def self.has_credited?(user_id)
    point = Point.where(user_id: user_id)
    point.exists?
  end
end
