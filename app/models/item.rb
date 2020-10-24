class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :sold_item
  has_one_attached :image

  validates :name , presence: true
  ONLY_NUM = /\A[0-9]+\z/
  validates :price , presence: true , numericality:{ greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999  } ,format: { with: ONLY_NUM }
  validates :explaination  , presence: true
  validates :category_id , numericality: { other_than: 1 } , presence: true
  validates :status_id , numericality: { other_than: 1 } , presence: true
  validates :ship_cost_id , numericality: { other_than: 1 } , presence: true
  validates :ship_location_id , numericality: { other_than: 1 } , presence: true
  validates :ship_day_id , presence: true
  validates :user_id , presence: true
  
end