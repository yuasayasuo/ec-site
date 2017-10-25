class OrdersController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @order = current_user.orders.new(book: @book)
  end
  
  def show
  end
  
  def create
    @order = current_user.orders.new(order_params)
    @book = @order.book
    
    if params[:back].present?
      render :new
    else
      if @order.save
        EcSiteMailer.registration_mail(current_user, @order).deliver
        redirect_to products_path, notice:'注文が完了しました。'
      end
    end
  end
  
  def confirm
    @order = current_user.orders.new(order_params)
    @book = @order.book
  end

  private
    def order_params
      params.require(:order).permit(:book_id, :address, :quantity)
    end
end
