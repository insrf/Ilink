class BooksController < ApplicationController
  before_action :find_books, only: %i[index]
  before_action :find_book, only: %i[show ]

  def index
  end

  def show
  end

  private

  def find_books
    @books = Book.all
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
