class Grouppost < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :body, presence: true
end
