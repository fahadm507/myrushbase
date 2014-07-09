class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :points
  validates :first_name ,presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
