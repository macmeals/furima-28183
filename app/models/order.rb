class Order < ApplicationRecord
  belongs_to :sold_item
  attr_accessor :token

end
