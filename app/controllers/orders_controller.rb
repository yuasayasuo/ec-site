class OrdersController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @order = current_user.orders.new(book: @book)
  end
  
  def create
    @order = current_user.orders.new(order_params)
    @book = @order.book
    
    if @order.save
      redirect_to products_path
    else
      render :new
    end
  end

  private
    def order_params
      params.require(:order).permit(:book_id, :addrss, :quantity)
    end
end
