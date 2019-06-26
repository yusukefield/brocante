class Host < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy

  validates :group_name, presence: true, length: { maximum: 15 }
  validates :rep_name, presence: true,  length: { maximum: 15 }
  validates :address, presence: true
  validates :phonenum, presence: true,  length: { maximum: 13 }
end