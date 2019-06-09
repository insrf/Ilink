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
      flash[:notice] = 'Your book successfully created.'
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    if current_user.author_of?(@book)
      @book.destroy
      flash[:notice] = 'you book successfully deleted'
    else
      flash[:notice] = 'you do not have enough rights'
    end
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :info)
  end

  def find_books
    @books = Book.all
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
