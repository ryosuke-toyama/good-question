require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報' do
    it '必須項目(Nickname, email, password, password_confirmation)があると登録できる。' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end
    it 'ニックネームが13文字以上だと登録できない' do
      @user.nickname = 'あああああああああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameは12文字以内で入力してください")
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'メールアドレスが重複していると登録できない' do
      @user.save
      @other_user = FactoryBot.build(:user)
      @other_user.email = @user.email
      @other_user.valid?

      expect(@other_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスは＠を含まないと登録できない' do
      @user.email = 'aaaaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'パスワードが５文字以下だと登録できない' do
      @user.password = 'aaa12'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数混合で入力して下さい')
    end
    it 'パスワードが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数混合で入力して下さい')
    end
    it 'パスワードが全角英数字だと登録できない' do
      @user.password = 'ａａａａ１２３'
      @user.password_confirmation = 'ａａａａ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数混合で入力して下さい')
    end
    it 'パスワード確認が相違していると登録できない' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'bbb321'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
