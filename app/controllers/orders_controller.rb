class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to orders_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code ,:prefecture_id ,:city ,:house_address ,:building ,:tell_number ,:sold_item_id)
  end

end

