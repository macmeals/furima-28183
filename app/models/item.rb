class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :sold_item
  has_one_attached :image

  with_options presence: true do
    validates :name  
    validates :price  , numericality:{ greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999  } ,format: { with: /\A[0-9]+\z/ }
    validates :explaination  
    validates :category_id , numericality: { other_than: 1 } 
    validates :status_id , numericality: { other_than: 1 } 
    validates :ship_cost_id , numericality: { other_than: 1 } 
    validates :ship_location_id , numericality: { other_than: 1 } 
    validates :ship_day_id 
    validates :user_id

  end
 
  
end