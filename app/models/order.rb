class Order < ApplicationRecord
  belongs_to :sold_item

  with_options presence: true do
    validates :post_code , format:{ with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :house_address
    validates :tell_number , format:{ with:/\A[0-9]+\z/},length: { maximum: 11 }
    
  end
end
