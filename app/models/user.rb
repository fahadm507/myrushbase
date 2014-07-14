class User < ActiveRecord::Base
  # has_many :followers, foreign_key: :following_user_id
  # has_many :reverse_followers, foreign_key: :followed_user_id, class_name: "Follower",
  #           dependent: :destroy

  # has_many :followed_users, through: :followers, foreign_key: :followed_user_id
  # has_many :following_users, through: :reverse_followers, foreign_key: :following_user_id
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  belongs_to :category
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :points
  validates :first_name ,presence: true
  validates :last_name, presence: true
  validates :category_id, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :thumbnail => "50x50>", :tiny =>"20x20>" }, :default_url => "/assets/images/user-default.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.is_following?(other_user, current_user)
    current_user.followed_users.where(followed_user_id: other_user.id).exists?
  end

  def follow!(other_user, current_user)
    current_user.followers.build(followed_user_id: other_user.id)
  end

  def unfollow!(other_user)
    Follower.find_by(other_user.id).destroy
  end
end
