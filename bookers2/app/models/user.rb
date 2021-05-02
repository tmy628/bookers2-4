class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # foreign_key: "followed_id"でどのカラムを参照して欲しいのかを定義する
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 被フォロー関係を通じてfollowed_idをフォローしている人を参照する

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id" ,dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # # 与フォロー関係を通じてfollower_idをフォローしている人を参照

  attachment :profile_image

  validates :name,
    presence: true, uniqueness: true, length: { in: 2..20 }
    # 文字数の制限を設ける→length #長さの範囲を2-20文字→in ..
    # 一意性を保つバリデーションの実装（uniqueness: true）
  validates :introduction,
    length: { maximum: 50 }
    # 長さの下限を50文字に設定→minimum
    # presence: trueは、空欄でないことを確認している
end
