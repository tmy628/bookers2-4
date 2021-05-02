class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    # = モデルから始まるときは単数形 Book
    favorite = current_user.favorites.new(book_id: book.id)
    # = そうでない時は複数形 favorites
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
