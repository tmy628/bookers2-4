class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book
  # Favoriteモデルに関連付けを追加する

end
