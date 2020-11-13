require 'rails_helper'

RSpec.describe OrderSold, type: :model do
  before do
    @order_sold = FactoryBot.build(:order_sold)
  end

  describe '商品購入機能'  do
   context do '商品購入が上手くいく時' 
    it do "number、exp_month、exp_year、cvc、post_code、prefecture_id、house_address、building、tell_numberがあれば商品を購入できる"
     expect(@order_sold.valid?).to eq true
    end
   end
        
   context do '商品購入が上手くいかない時'
    it do 'tokenがないと購入できない'
      @order_sold.token =""
      @order_sold.valid?
      expect(@order_sold.errors.full_messages).to include("Token can't be blank")
    end

    it do 'post_codeがないと購入できない'
     @order_sold.post_code = ""
     @order_sold.valid?
     expect(@order_sold.errors.full_messages).to include("Post code can't be blank")
    end

    it do 'post_codeはハイフン付きの数字でないと購入できない'
      @order_sold.post_code = "1234567"
      @order_sold.valid?
      expect(@order_sold.errors.full_messages).to include("Post code is invalid")
    end

    it do 'cityがないと購入できない'
      @order_sold.city = ""
      @order_sold.valid?
      expect(@order_sold.errors.full_messages).to include("City can't be blank")
    end

    it do 'house_addressがないと購入できない'
      @order_sold.house_address = ""
      @order_sold.valid?
      expect(@order_sold.errors.full_messages).to include("House address can't be blank")
    end

    it do 'tell_numberがないと購入できない'
      @order_sold.tell_number = ""
      @order_sold.valid?
      expect(@order_sold.errors.full_messages).to include("Tell number can't be blank")
    end

    it do 'tell_numberが12桁以上だと購入できない'
      @order_sold.tell_number = "123412341234"
      @order_sold.valid?
      expect(@order_sold.errors.full_messages).to include("Tell number is too long (maximum is 11 characters)")
    end
  end
end
end

