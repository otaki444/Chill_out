require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	    @post = create(:post)
	    @comment = Comment.new(
	    	user_id: @user.id,
	    	post_id: @post.id,
	    	comment: Faker::Lorem.characters(number:100)
	    )
	end

    context 'commentカラム' do
      it '空欄でないこと' do
        @comment.comment = ''
        expect(@comment.valid?).to eq false;
      end
      it '100文字以下であること' do
        @comment.comment = Faker::Lorem.characters(number:101)
        expect(@comment.valid?).to eq false;
      end
    end
  end
end
