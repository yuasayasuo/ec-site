class DeliveriesController < ApplicationController

  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to deliveries_path, notice:'注文ステータスを変更しました。'
    end
  end

  private
    def order_params
      params.require(:order).permit(:book_id, :address, :quantity, :status)
    end
end
