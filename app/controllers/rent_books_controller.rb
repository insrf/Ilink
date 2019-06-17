class RentBooksController < ApplicationController
  before_action :find_rent_books, only: %i[index]
  before_action :find_rent_book, only: %i[show edit update destroy]
  before_action :find_book, only: %i[new create]

  def index
    @rent_books = Book.find(params[:book_id]).rent_books
  end

  def search
    if params[:start_date].present? || params[:end_date].present?
      @rent_books = RentBook.before_date(params[:start_date]).after_date(params[:end_date])
    else
      @rent_books = RentBook.all
      flash[:alert] = "Start date or End date cannot be empty"
    end
  end

  def show
  end

  def new
    @rent_book = @book.rent_books.new
  end

  def edit
  end

  def create
    @rent_book = @book.rent_books.new(rent_book_params)
    @rent_book.user_id = current_user.id

    if @rent_book.save
      redirect_to @rent_book, notice: "Your rent_book successfully created."
    else
      render :new
    end
  end

  def update
    if @rent_book.update(rent_book_params)
      redirect_to @rent_book, notice: "Your rent_book successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @rent_book.destroy
    redirect_to book_rent_books_path(@rent_book.book), notice: "Your rent_book successfully deleted"
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def rent_book_params
    params.require(:rent_book).permit(:start_rent_time, :end_rent_time)
  end

  def find_rent_books
    @rent_books = RentBook.all
  end

  def find_rent_book
    @rent_book = RentBook.find(params[:id])
  end
end
