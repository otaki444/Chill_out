require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'Followモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:follows).macro).to eq :has_many
      end
    end

    context 'Followerモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followers).macro).to eq :has_many
      end
    end

    context 'Imageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:images).macro).to eq :has_many
      end
    end

    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Messageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:messages).macro).to eq :has_many
      end
    end

    context 'Entryモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:entries).macro).to eq :has_many
      end
    end
  end

  describe 'バリデーションのテスト' do
  	before do
	    @user = create(:user)
	end

    context 'nameカラム' do
	    it '空欄だと無効' do
        @user.name = ""
	      expect(@user).not_to be_valid
	    end

	    it '2文字以上でなければ無効' do
	      @user.name = Faker::Lorem.characters(number:1)
	      expect(@user).not_to be_valid
	    end

	    it '20文字以下でなければ無効' do
	      @user.name = Faker::Lorem.characters(number:21)
	      expect(@user).not_to be_valid
	    end
    end

    context 'name_kanaカラム' do
      it '空欄だと無効' do
        @user.name_kana = ""
        expect(@user).not_to be_valid
      end
    end

    context 'nicknameカラム' do
      it '空欄だと無効' do
        @user.nickname = ""
        expect(@user).not_to be_valid
      end

      it '20文字以下でなければ無効' do
        @user.nickname = Faker::Lorem.characters(number:21)
        expect(@user).not_to be_valid
      end
    end

    context 'introductionカラム' do
      it '50文字以下でなければ無効' do
        @user.introduction = Faker::Lorem.characters(number:51)
        expect(@user).not_to be_valid
      end
    end

    context 'one_wordカラム' do
      it '20文字以下でなければ無効' do
        @user.one_word = Faker::Lorem.characters(number:21)
        expect(@user).not_to be_valid
      end
    end
  end
end
