class ProductsController < ApplicationController
  before_action :set_book, only: [:show]
  
  def index
    @books = Book.all
  end

  def show
  end
  
  private
    def set_book
      @book = Book.find(params[:id])
    end
    
    def product_params
      params.require(:book).permit(:title, :author, :published_on, :showing, :price, :picture, tag_ids: [])
    end
end
