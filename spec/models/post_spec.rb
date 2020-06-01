require 'rails_helper'

RSpec.describe Post, type: :model do
    describe 'アソシエーションのテスト' do
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:likes).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'Imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_images).macro).to eq :has_many
      end
    end

    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	    @post = Post.new(
	    	user_id: @user.id,
	    	title: Faker::Lorem.characters(number:20),
	    	article: Faker::Lorem.characters(number:100)
	    )
	end

    context 'titleカラム' do
      it '空欄でないこと' do
        @post.title = ''
        expect(@post.valid?).to eq false;
      end
      it '20文字以下であること' do
        @post.title = Faker::Lorem.characters(number:21)
        expect(@post.valid?).to eq false;
      end
    end

    context 'articleカラム' do
      it '空欄でないこと' do
        @post.article = ''
        expect(@post.valid?).to eq false;
      end
      it '100文字以下であること' do
        @post.article = Faker::Lorem.characters(number:101)
        expect(@post.valid?).to eq false;
      end
    end
  end
end
