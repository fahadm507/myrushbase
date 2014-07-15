class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  def self.find_questions_and_answers(category)
    user_ids = category.users_ids
    where("user_id IN (?) ", user_ids )
  end
end
