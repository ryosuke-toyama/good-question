require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = Room.new(room_name: 'あああああ')
  end

  describe 'ルーム情報' do
    it 'ルーム名があると登録できる' do
      expect(@room).to be_valid
    end
    it 'ルーム名が空だと登録できない' do
      @room.room_name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("Room nameを入力してください")
    end
    it 'ルーム名が11文字以上だと登録できない' do
      @room.room_name = 'あああああああああああ'
      @room.valid?
      expect(@room.errors.full_messages).to include("Room nameは10文字以内で入力してください")
    end
  end
end
