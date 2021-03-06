class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :joins, dependent: :destroy
  has_many :events, through: :joins, source: :user, foreign_key: 'User_id'
  has_many :articles, dependent: :destroy
  has_many :articles, through: :likes, source: :user, foreign_key: 'User_id'
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :webname, presence: true, length: { maximum: 15 }
  validates :profile, length: { maximum: 100 }
end
