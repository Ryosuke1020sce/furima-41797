require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do 
      it '値が正しければ新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end      
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationがpasswordと一致しないと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'birthdayが空では登録できない' do        
        @user.birthday = ""
        @user.valid?
	      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "a1234"
        @user.password_confirmation = @user.password
        @user.valid?
	      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合での入力が必須（英字のみNG）' do
        @user.password = "abcdefg"
        @user.password_confirmation = @user.password
        @user.valid?
	      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordは半角英数字混合での入力が必須（数字のみNG）' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
	      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end      
      it '名前（姓）は全角での入力が必須' do
        @user.family_name_kana = "yamada"
        @user.valid?
	      expect(@user.errors.full_messages).to include("Family name kana 全角カナ文字を使用してください")
      end
      it '名前（名）は全角での入力が必須' do
        @user.first_name_kana = "taro"
        @user.valid?
	      expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end
      it '名前（姓）カナは全角カナでの入力が必須' do
        @user.family_name_kana = "山田"
        @user.valid?
	      expect(@user.errors.full_messages).to include("Family name kana 全角カナ文字を使用してください")
      end
      it '名前（名）カナは全角カナでの入力が必須' do
        @user.first_name_kana = "太郎"
        @user.valid?
	      expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end
      it 'mailは@が必須であること' do
        @user.email = "mailmail"
        @user.valid?
	      expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
    
  end
end
