class Book < ApplicationRecord

  belongs_to :user

  # バリデーション設定
  validates :title, presence: :true
  validates :body, presence: :true, length:{ maximum: 200 }

end
