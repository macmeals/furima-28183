class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_many :comments
  has_one :sold_item
  has_one_attached :image

  #categoryの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 

end
