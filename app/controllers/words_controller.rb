class WordsController < ApplicationController
  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to controller: 'books', action: 'show', id: @word.book_id
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to controller: 'books', action: 'show', id: @word.book_id
  end

  private

  def word_params
    params.require(:word).permit(:name, :description, :book_id)
  end
end
