require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comment).macro).to eq :has_many
      end
    end

    context 'Followモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:follow).macro).to eq :has_many
      end
    end

    context 'Followerモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:follower).macro).to eq :has_many
      end
    end

    context 'Imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:Image).macro).to eq :has_many
      end
    end

    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:like).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorite).macro).to eq :has_many
      end
    end

    context 'Messageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:message).macro).to eq :has_many
      end
    end

    context 'Entryモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:entry).macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	end

    context 'Favoriteカラム' do
	    it '必要項目が存在していれば有効' do
	      expect(@favorite).to be_valid
	    end

	    it 'user_idが存在していなければ無効' do
	      @favorite.user_id = ""
	      expect(@favorite).not_to be_valid
	    end

	    it 'post_idが存在していなければ無効' do
	      @favorite.post_id = ""
	      expect(@favorite).not_to be_valid
	    end
    end
  end
end
