class CartsController < ApplicationController

  def index
    @cart_contents = session[:book_ids]
    @cart_contents = [] if @cart_contents.blank?
    @books = Book.find(@cart_contents)
  end

end