class Event < ApplicationRecord
  #prefecture_codeからprefecture_nameに変換する
  attachment :picture
  geocoded_by :address
  after_validation :geocode

  include JpPrefecture
     jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
