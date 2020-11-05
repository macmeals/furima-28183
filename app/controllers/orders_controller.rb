class OrdersController < ApplicationController
  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to orders_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code ,:prefecture_id ,:city ,:house_address ,:building ,:tell_number ,:sold_item_id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_154d5a0e8f715869aab05cb4"  
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],    
      currency: 'jpy'               
    )
  end

end

