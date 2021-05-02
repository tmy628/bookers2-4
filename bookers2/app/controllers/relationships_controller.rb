class RelationshipsController < ApplicationController
  # フォロー機能を作成・保存・削除する
  def create
    current_user.follow(params[:user.id])
    # userモデルで定義したfollowメソッドを呼び出す
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:user.id])
    # userモデルで定義したunfollowメソッドを呼び出す
    redirect_back(fallback_location: root_path)
  end
  # relationshipsとusersはネストの関係のため、userモデルからメソッドの呼び出しも可能

  # フォロー・フォロワー一覧を表示する
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    # userモデルで定義したアソシエーションを利用
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    # userモデルで定義したアソシエーションを利用
  end
  # user = User.find(params[:user_id])で取得したユーザーのidが、フォローしている
  # もしくはフォローされているユーザーのid一覧を取得することができる
end
