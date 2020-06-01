require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Like.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	    @post = create(:post)
	    @like = Like.new(
	    	user_id: @user.id,
	    	post_id: @post.id
	    )
	end

    context 'like' do
	    it '必要項目が存在していれば有効' do
	      expect(@like).to be_valid
	    end

	    it 'user_idが存在していなければ無効' do
	      @like.user_id = ""
	      expect(@like).not_to be_valid
	    end

	    it 'post_idが存在していなければ無効' do
	      @like.post_id = ""
	      expect(@like).not_to be_valid
	    end
    end
  end
end
