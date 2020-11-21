class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :sold_items
  has_many :comments
  
  with_options presence: true do
    validates :nickname
    validates :birth_day 
    validates :email , uniqueness:{ case_sensitive: true } , format: { with: /\A[a-zA-Z0-9.!#%&'*+\/=?_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }
    validates :password , length: { minimum: 6 } , format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
    
    with_options format:{ with: /\A[ぁ-んァ-ヶーー-龠]+$\z/ } do
      validates :family_name
      validates :first_name  
    end
    
    with_options format:{ with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+$\z/ } do
      validates :family_kana
      validates :first_kana 
    end
  end
end 
