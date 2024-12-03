require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_delivery = FactoryBot.build(:buy_delivery, user_id: user.id, item_id: item.id)
    sleep 0.2
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it 'すべて値が正しければ購入できる' do
        expect(@buy_delivery).to be_valid
      end
      it '建物名は空でも購入できる' do
        @buy_delivery.building = ""
        expect(@buy_delivery).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'トークンが空だと購入できない' do
        @buy_delivery.token = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it '都道府県選択が「1」だと購入できない' do
        @buy_delivery.prefecture_id = 1
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空だと購入できない' do
        @buy_delivery.city = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @buy_delivery.tel = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号の桁数が９桁以下では購入できない' do
        @buy_delivery.tel = '123456789'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Tel 10～11桁、「-」ハイフンなしで記入してください")
      end
      it '電話番号の桁数が１２桁以上では購入できない' do
        @buy_delivery.tel = '123456789012'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Tel 10～11桁、「-」ハイフンなしで記入してください")
      end
      it '電話番号に半角数字以外が含まれると購入できない' do
        @buy_delivery.tel = '123456790a'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Tel 10～11桁、「-」ハイフンなしで記入してください")
      end
      it '郵便番号が空だと購入できない' do
        @buy_delivery.post_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号の形式が異なると購入できない' do
        @buy_delivery.post_code = '11-111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code 「000-0000」の形で記入してください")
      end
      it '郵便番号に「-（ハイフン）」を入力しないと購入できない' do
        @buy_delivery.post_code = '1111111'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code 「000-0000」の形で記入してください")
      end
      it 'ユーザーが紐づいていないと購入できない' do
        @buy_delivery.user_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐づいていないと購入できない' do
        @buy_delivery.item_id = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
