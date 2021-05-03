class Book < ApplicationRecord
   belongs_to :user
   has_many :book_comments, dependent: :destroy
   # BookモデルとBookCommentモデルを関連付ける
   has_many :favorites, dependent: :destroy
   # Bookモデルに関連付けを追加する

   validates :title,
     presence: true
   validates :body,
     presence: true, length: { maximum: 200 }

   def favorited_by?(user)
     favorites.where(user_id: user.id).exists?
   end
   # favorited_by?メソッドを作成
   # このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
   # 存在していればtrue、存在していなければfalseを返すようにしている
end
