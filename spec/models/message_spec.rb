require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	    @room = create(:room)
	    @message = Message.new(
	    	user_id: @user.id,
	    	room_id: @room.id,
	    	message: Faker::Lorem.characters(number:200)
	    )
	end

    context 'message' do
	    it '必要項目が存在していれば有効' do
	      expect(@message).to be_valid
	    end

		it 'user_idが存在していなければ無効' do
		  @message.user_id = ""
		  expect(@message).not_to be_valid
		end

		it 'room_idが存在していなければ無効' do
		  @message.room_id = ""
		  expect(@message).not_to be_valid
		end
    end


    context 'messageカラム' do
      it '空欄でないこと' do
        @message.message = ''
        expect(@message.valid?).to eq false;
      end
      it '200文字以下であること' do
        @message.message = Faker::Lorem.characters(number:201)
        expect(@message.valid?).to eq false;
      end
    end
  end
end
