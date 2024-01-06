class BooksController < ApplicationController

  def index
    @newbook = Book.new
    # @book = Book.find(params[:id])
    @books = Book.all
  end

  def create
    @newbook = Book.new(book_params)
    if @newbook.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@newbook.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
