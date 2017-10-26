class ProductsController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :add_to_cart, only: [:update]
  
  def index
    @books = Book.all
  end

  def show
  end
  
  def update
    redirect_to products_path, notice:'商品をカートに追加しました。'
  end
 
  private
    def set_book
      @book = Book.find(params[:id])
    end
 
    def add_to_cart
      cart_contents = session[:book_ids]
      cart_contents = [] if cart_contents.blank?
      cart_contents.push(params[:id])
      session[:book_ids] = cart_contents.uniq
    end
    
    def product_params
      params.require(:book).permit(:title, :author, :published_on, :showing, :price, :picture, tag_ids: [])
    end
end
