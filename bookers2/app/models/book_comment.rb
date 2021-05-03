class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  # UserモデルとBookCommentモデルを関連付ける

  validates :comment,
     presence: true
  # 空のコメントは保存できないように設定
end
