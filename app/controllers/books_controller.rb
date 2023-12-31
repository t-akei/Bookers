class BooksController < ApplicationController

  def new
    @booker = Book.new
  end

  def create
    @booker = Book.new(book_params)

    if @booker.save

      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@booker.id)

    else
      @books = Book.all
      render :index
    end

  end

  def index
    @books = Book.all
    @booker = Book.new
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
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end



