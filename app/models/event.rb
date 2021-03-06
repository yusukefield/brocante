class Event < ApplicationRecord
  attachment :picture
  belongs_to :host
  has_many :joins, dependent: :destroy, foreign_key: 'Event_id'
  has_many :users, through: :joins, source: :event
  geocoded_by :address
  after_validation :geocode
  default_scope -> { order(date: :desc) }
  # 時間の降順に表示
  with_options presence: true do
    validates :title, length: { maximum: 30 }
    validates :body, length: { maximum: 1000 }
    validates :address
    validates :date
  end
  def join_user(user_id)
    joins.find_by(user_id: user_id)
  end

  include JpPrefecture
     jp_prefecture :prefecture_code
  #prefecture_codeからprefecture_nameに変換する
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
