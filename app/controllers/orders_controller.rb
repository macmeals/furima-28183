class OrdersController < ApplicationController
  before_action :set_item , only: [:index, :create ,:pay_item]

  def index
    if @item.sold_item.present?
       redirect_to root_path
    elsif user_signed_in? && current_user.id == @item.user_id
    # @item = Item.find(params[:item_id])
       redirect_to root_path
    elsif user_signed_in?
       @order_sold = OrderSold.new
       render 'index'
    else
       redirect_to new_user_session_path
    end 

  end

  def create
    # @item = Item.find(params[:item_id])
       @order_sold = OrderSold.new(order_params)
    if @order_sold.valid?
       pay_item
       @order_sold.save
       return redirect_to root_path
     else
         render 'index'
     end

  end

  private

  def order_params
    params.require(:order_sold).permit(:number,:exp_month,:post_code ,:exp_year,:cvc, :prefecture_id ,:city ,:house_address ,:building ,:tell_number ,:sold_item_id,).merge(token: params[:token], user_id: current_user.id, item_id:params[:item_id])
  end

  def pay_item
    # @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_154d5a0e8f715869aab05cb4" 
    Payjp::Charge.create(
      amount: @item.price ,
      card: params[:token],    
      currency: 'jpy'               
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

