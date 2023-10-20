class BooksController < ApplicationController
  def new
  end
  
  def create
    book = Book.new(book_params)
    
    book.save
    
    redirect_to '/show'
    
  end

  def index
    @book = Book.all
  end

  def show
  end

  def edit
  end
  
  
  
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end



