require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できる場合' do
      it 'nickname,email,password,last_name,farst_name,last_name_reading,farst_name_reading,birtdayが入力されると保存できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが保存出来ない場合' do
      it 'nicknameが空だと保存できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと保存できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複したものだと保存できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        binding.pry
        expext(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと保存できない' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下だと保存できない' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英数字混合でないと保存できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが一致しないと保存できない' do
        @user.password = 'aaaa1111'
        @user.password_confirmation = '1111aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと保存できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角かな、カナ、漢字のいずれかでないと保存出来ない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空だと保存できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角かな、カナ、漢字のいずれかでないと保存出来ない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_name_readingが空だと保存できない' do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'last_name_readingが全角カナでないと保存出来ない' do
        @user.last_name_reading = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
      end
      it 'first_name_readingが空だと保存できない' do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'last_name_readingが全角カナでないと保存出来ない' do
        @user.first_name_reading = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end
      it 'birthdayが空だと保存できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
