require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、lastnameとfirstname、lastname_kanaとfirstname_kana、birthdayが存在すれば登録できる'do
       expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる'do
       @user.password = '000aaa'
       @user.password_confirmation = '000aaa'
       expect(@user).to be_valid
      end
      it 'パスワードが半角英数混合であれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空で登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空で登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空で登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = '00aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it '数字のみのpasswordでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it '全角文字を含むpasswordは登録できない' do
        @user.password = 'テスト'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空で登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstnameが空で登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
          @user.lastname = 'taro'
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters")
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.firstname = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid. Input full-width characters")
      end
      it 'lastname_kanaが空で登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'firstname_kanaが空で登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'lastname_kanaが全角（カタカナ）でないと登録できない' do
        @user.lastname_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid. Input full-width katakana characters")
      end
      it 'firstname_kanaが全角（カタカナ）でないと登録できない' do
        @user.firstname_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters")
      end
      it 'birthdayが空で登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
