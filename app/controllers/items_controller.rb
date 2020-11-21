class ItemsController < ApplicationController
  before_action :set_item , only: [:edit, :show, :update, :destroy ]
  
  def index
    @items = Item.all.order("created_at DESC")
    
  end

  def new
   @item = Item.new
    if user_signed_in?
      render "new"
    else
      flash[:notice]= "You need to sign in or "
      flash[:alert] = "sign up before continuing"
      redirect_to new_user_session_path
    end 
  end
  
  def create
   @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
   else
     render "new"
   end  
  end

  def show 
    @comment = Comment.new
  end

  def edit
    if user_signed_in? && current_user.id == @item.user_id
      render "edit"
    elsif user_signed_in?
      @items = Item.all.order("created_at DESC")
      render "index"
    else
      redirect_to new_user_session_path      
    end

  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
       render "edit"
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to items_path
    else
      render "index"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:price,:explaination,:category_id,:status_id,:ship_cost_id,:ship_location_id,:ship_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
