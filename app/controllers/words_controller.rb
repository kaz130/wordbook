class WordsController < ApplicationController
  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to controller: 'books', action: 'show', id: @word.book_id
    end
  end

  private

  def word_params
    params.require(:word).permit(:name, :description, :book_id)
  end
end
