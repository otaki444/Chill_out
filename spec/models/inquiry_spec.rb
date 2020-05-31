require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'バリデーションのテスト' do
  	before do
	    @inquiry = create(:inquiry)
	end

    context 'nameカラム' do
	    it '空欄だと無効' do
	      @inquiry.name = ""
	      expect(@inquiry).not_to be_valid
	    end

	    it '2文字以上でなければ無効' do
	      @inquiry.name = Faker::Lorem.characters(number:1)
	      expect(@inquiry).not_to be_valid
	    end

	    it '20文字以下でなければ無効' do
	      @inquiry.name = Faker::Lorem.characters(number:21)
	      expect(@inquiry).not_to be_valid
	    end
    end

    context 'emailカラム' do
	    it '空欄だと無効' do
	      @inquiry.email = ""
	      expect(@inquiry).not_to be_valid
	    end
    end

    context 'messageカラム' do
	    it '空欄だと無効' do
	      @inquiry.message = ""
	      expect(@inquiry).not_to be_valid
	    end
    end
  end
end
