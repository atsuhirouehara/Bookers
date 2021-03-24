class BooksController < ApplicationController

 def index
  @book = Book.new
  @books = Book.all
 end 
 
 def create
  flash[:notice] = "Book was successfully created."
  @book = Book.new(book_params)
  if @book.save
  redirect_to book_path(@book.id)
  else
  @books = Book.all 
  render :index
  end
 end 
 
 def show
  @book = Book.find(params[:id])
 end
 
 def edit
  @book = Book.find(params[:id])
 end
 
 def update
  flash[:notice] = "Book was successfully updated."
  @book = Book.find(params[:id])
  if @book.update(book_params)
  redirect_to book_path(@book.id)
  else
  render :edit
  end
 end
 
 def destroy
  book = Book.find(params[:id])  # データ（レコード）を1件取得
  book.destroy  # データ（レコード）を削除
  redirect_to '/books'
 end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
 
end

