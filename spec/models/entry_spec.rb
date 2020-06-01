require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Entry.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Entry.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	    @room = create(:room)
	    @entry = Entry.new(
	    	user_id: @user.id,
	    	room_id: @room.id
	    )
	end

    context 'Entry' do
	    it '必要項目が存在していれば有効' do
	      expect(@entry).to be_valid
	    end

	    it 'user_idが存在していなければ無効' do
	      @entry.user_id = ""
	      expect(@entry).not_to be_valid
	    end

	    it 'room_idが存在していなければ無効' do
	      @entry.room_id = ""
	      expect(@entry).not_to be_valid
	    end
    end
  end
end