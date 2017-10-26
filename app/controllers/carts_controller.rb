class CartsController < ApplicationController

  def index
    @cart_contents = session[:book_ids]
      
    if @cart_contents.nil?
        @cart_contents = Array.new
    end
  end

end