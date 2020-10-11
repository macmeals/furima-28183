require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,family_name,first_name,family_kana,first_kana,birth_dayが存在すれば登録できる"
       expect(@user).to be_valid
      end
      it "emailに「＠」が入っていれば登録できる" do
       
      end
      it "passwordに６文字以上の半角英数字を入れれば登録できる" do
      end
      it "family_nameが全角であれば登録できる" do
      end
      it "first_nameが全角であれば登録できる" do
      end
      it "family_kanaが全角であれば登録できる" do
      end
      it "first_kanaが全角であれば登録できる" do
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailは登録できない（既にDBに存在してるemailはDBに登録できない" do
        @user.save
        another_email  = FactoryBot.build(:user, email: @user.email)
        another_email.valid?
        expect(another_email.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordは5文字以下だと登録できない" do
      end  
      it "passwordは半角英数でないと登録できない" do
      end
      it "passwordは半角英数でないと登録できない" do
      end
      it "family_nameが全角でないと登録できない" do
      end
      it "first_nameが全角でないと登録できない" do
      end
      it "family_kanaが全角でないと登録できない" do
      end
      it "first_kanaが全角でないと登録できない" do
      end
      it "birth_dayがが空だと登録できない" do
      end
    end
  end