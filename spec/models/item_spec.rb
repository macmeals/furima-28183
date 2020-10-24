require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
   @item = FactoryBot.build(:item, user_id:user.id)
  end

  describe '商品出品機能' do 
    context '商品が出品できる' do
      it "name , price , explaination , category_id , status_id ,ship_cost_id ,ship_location_id, ship_day_id , user_id が存在すれば、商品を登録できる" do
       expect(@item.valid?).to eq true
    end

  end

    context '商品が出品できない' do
      it "nameが存在しないと商品が出品できない"  do
         @item.name = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "priceが存在しないと商品が出品できない"  do
         @item.price = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceの値が300未満だと出品できない"  do
         @item.price = "299"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceの値が9999999より上だと出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceの値が半角数字でないと出品できない" do
        @item.price = "４０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "explainationが存在しないと商品が出品できない" do
        @item.explaination = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explaination can't be blank")
      end

      it "category_idが存在しないと商品が出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが存在しないと商品が出品できない" do
        @item.status_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "ship_cost_idが存在しないと商品が出品できない" do
        @item.ship_cost_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost can't be blank")
      end

      it "ship_location_idが存在しないと商品が出品できない" do
        @item.ship_location_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship location can't be blank")

      end

      it "ship_day_idが存在しないと商品が出品できない" do
        @item.ship_day_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

    end

    end

end
