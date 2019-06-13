class BooksController < ApplicationController
  before_action :authenticate_user!, except: %w[index show]
  before_action :find_books, only: %i[index]
  before_action :find_book, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Your book successfully created."
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Your book successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Your book successfully deleted"
  end

  private

  def book_params
    params.require(:book).permit(:parent_id, :title, :info)
  end

  def find_books
    @books = Book.all
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
