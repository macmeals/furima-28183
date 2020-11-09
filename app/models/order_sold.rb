class OrderSold
  include ActiveModel::Model
  attr_accessor :number,:exp_month,:exp_year ,:cvc ,:token, :post_code ,:prefecture_id ,:city,:house_address,:building ,:tell_number ,:sold_item_id ,:user_id ,:item_id 
  
  with_options presence: true do
    validates :post_code , format:{ with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_address
    validates :tell_number , format:{ with:/\A[0-9]+\z/},length: { maximum: 11 }
    validates :token

  end

    def save
      # binding.pry
      solditem = SoldItem.create(user_id: user_id , item_id: item_id)
      order = Order.create(post_code: post_code ,prefecture_id: prefecture_id , city: city ,house_address: house_address , sold_item_id:solditem.id , tell_number:tell_number)
    end
    
end