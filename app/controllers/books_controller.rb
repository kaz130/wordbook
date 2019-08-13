class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :destroy]
  before_action :set_words, only: [:show, :destroy]

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

  def destroy
    @words.each do |word|
      word.destroy
    end
    @book.destroy
    redirect_to books_url, notice: "単語帳「#{@book.name}」を削除しました．"
  end

  private

  def book_params
    params.require(:book).permit(:name, :description)
  end

  def set_book
    @book = current_user.books.find(params[:id])
  end

  def set_words
    @words = current_user.books.find(params[:id]).words
  end
end
