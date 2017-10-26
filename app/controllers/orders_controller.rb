class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @book = Book.find(params[:book_id])
    @order = current_user.orders.new(book: @book)
  end
  
  def show
  end
  
  def create
    @order = current_user.orders.new(order_params)
    @order.status = 'ordered'
    @book = @order.book
    
    if params[:back].present?
      render :new
    else
      if @order.save
        EcSiteMailer.registration_mail(current_user, @order, @book).deliver
        redirect_to products_path, notice:'注文が完了しました。'
      end
    end
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to orders_path, notice:'注文ステータスを変更しました。'
    end
  end

  def confirm
    @order = current_user.orders.new(order_params)
    @book = @order.book
  end

  private
    def order_params
      params.require(:order).permit(:book_id, :address, :quantity, :status)
    end
end
