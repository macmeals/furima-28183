class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :sold_item

  validates :nickname, :birth_day, presence: true 
  validates :email, presence: true , uniqueness: true ,inclusion: { in :["@"]}
  validates :password, presence: true , length: { maximum: 6 } ,format:{ with: /^[a-zA-Z0-9]+$/ }
  validates :family_name, :first_name , presence: true ,format:{ with: /^[ぁ-んァ-ヶー一-龠]+$/ }
  validates :family_kana, :first_kana , presence: true ,format:{ with: /^[ア-ン゛゜ァ-ォャ-ョー「」、]+$/ }


end 
