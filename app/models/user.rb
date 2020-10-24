class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :sold_items
  
  validates :nickname, :birth_day, presence: true 
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#%&'*+\/=?_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  validates :email, presence: true , uniqueness:{ case_sensitive: true } ,format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true , length: { minimum: 6 } ,format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
  validates :family_name, :first_name , presence: true , format:{ with: /\A[ぁ-んァ-ヶーー-龠]+$\z/ }
  validates :family_kana, :first_kana , presence: true , format:{ with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+$\z/ }

end 
