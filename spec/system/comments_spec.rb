require 'rails_helper'

RSpec.describe "Comments", type: :system do
	describe "コメントテスト" do
		let!(:user) { create(:user) }
		let!(:post) { create(:post, user: user) }
		let!(:comment) { create(:comment, user: user, post: post) }
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_button 'ログイン'
		end

		describe '新規投稿' do
			context '動作の確認' do
				before do
					visit post_path(post.id)
				end
				it 'コメントフォームが表示される' do
					expect(page).to have_field 'comment[comment]'
				end
			end
		end
	end
end
