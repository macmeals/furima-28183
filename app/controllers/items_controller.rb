class ItemsController < ApplicationController
  def index
    
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

  private

  def item_params
    params.require(:item).permit(:image,:name,:price,:explaination,:category_id,:status_id,:ship_cost_id,:ship_location_id,:ship_day_id).merge(user_id: current_user.id)
  end

end
