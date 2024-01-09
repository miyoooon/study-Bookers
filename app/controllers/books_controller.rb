class BooksController < ApplicationController

  def index
    @newbook = Book.new
    @books = Book.all
  end

  def create
    @newbook = Book.new(book_params)
    if @newbook.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@newbook.id)
    else
      flash.now[:notice] = "投稿に失敗しました。"
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "更新しました。"
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
