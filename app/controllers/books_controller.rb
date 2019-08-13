class BooksController < ApplicationController
  def index
    @books = current_user.books.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: "単語帳「#{@book.name}」を登録しました．"
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :description)
  end
end
