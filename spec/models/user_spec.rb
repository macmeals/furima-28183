require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it "nickname,email,password,family_name,first_name,family_kana,first_kana,birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
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

      it "passwordが空だと登録できない"  do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordは5文字以下だと登録できない"  do
        @user.password = "qa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end  

      it "passwordは半角英数でないと登録できない" do
        @user.password = "テスト"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "family_nameが全角でないと登録できない" do
        @user.family_name = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角でないと登録できない" do
        @user.first_name = "ｼﾞﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_kanaが空だと登録できない"  do
        @user.family_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end

      it "family_kanaが全角カナでないと登録できない" do
        @user.family_kana = "suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid")
      end

      it "first_kanaが空だと登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end

      it "first_kanaが全角カナでないと登録できない" do
        @user.first_kana = "jiro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end

      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
