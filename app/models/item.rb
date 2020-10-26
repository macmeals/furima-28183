class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status 
  belongs_to_active_hash :ship_cost
  belongs_to_active_hash :ship_location 
  belongs_to_active_hash :ship_day
  belongs_to :user
  has_one :sold_item
  has_one_attached :image

  with_options presence: true do
    validates :name  
    validates :price  , numericality:{ greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999  } ,format: { with: /\A[0-9]+\z/ }
    validates :explaination  
    with_options numericality: { other_than: 1 } do
     validates :category_id 
     validates :status_id  
     validates :ship_cost_id  
     validates :ship_location_id 
     validates :ship_day_id 
    end
    validates :user_id

  end
 
  
end