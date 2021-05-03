class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book
  # Favoriteモデルに関連付けを追加する

  validates_uniqueness_of :book_id, scope: :user_id
  # validates_uniqueness_of(検証するフィールド名 [, オプション])
  # book_idとuser_idの一意性をチェックする
  # favoritesテーブルに 同一の組み合わせのbook_idとuser_idがあるかを調べる
end
