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
      
      if cart_contents.nil?
        cart_contents = Array.new
      else
        if cart_contents.include?(params[:id]) == false
          cart_contents.push(params[:id])
        end
      end
      
      session[:book_ids] = cart_contents
    end
    
    def product_params
      params.require(:book).permit(:title, :author, :published_on, :showing, :price, :picture, tag_ids: [])
    end
end
