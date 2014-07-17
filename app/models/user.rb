class User < ActiveRecord::Base
  # has_many :followers, foreign_key: :following_user_id
  # has_many :reverse_followers, foreign_key: :followed_user_id, class_name: "Follower",
  #           dependent: :destroy

  # has_many :followed_users, through: :followers, foreign_key: :followed_user_id
  # has_many :following_users, through: :reverse_followers, foreign_key: :following_user_id
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
            class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  belongs_to :category
  has_many :questions
  has_many :answers
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

  has_attached_file :avatar, styles: { medium: "300x300>",
    thumb: "100x100>", thumbnail: "50x50>", tiny: "30x30>" },
    default_url: "user-default_:style.jpeg",
    storage: :s3,
    url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename'",
    s3_credentials: "config/secrets.yml"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.users_by_category(query,user,category_id)
    where("category_id = ? AND (first_name LIKE ? OR last_name LIKE ?)", category_id, "%#{query}%", "%#{query}%")
  end

  def self.search_users(query, user)
    where("first_name like ? OR last_name like ?", "%#{query}%", "%#{query}%")
  end

  def self.suggested_users(category)
    user_ids = category.user_ids
    where("id IN (?)", user_ids)
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

end
