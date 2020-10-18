class ItemsController < ApplicationController
  def index
    
  end

  def new
   @item = Item.new
  end
  
  def create
   @item = Item.new(item_params)
   @item.save
   redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:price,:explaination,:category_id,:status_id,:ship_cost_id,:ship_location_id,:ship_day_id).merge(user_id: current_user.id)
  end

end
