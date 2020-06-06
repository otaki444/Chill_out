require 'rails_helper'

RSpec.describe "Posts", type: :system do
	describe "投稿テスト" do
		let!(:user) { create(:user) }
		let!(:post) { create(:post, user: user) }
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_button 'ログイン'
		end

		describe '新規投稿' do
			context '動作の確認' do
				before do
					visit posts_path
				end
				it 'titleフォームが表示される' do
					expect(page).to have_field 'post[title]'
				end
				it 'articleフォームが表示される' do
					expect(page).to have_field 'post[article]'
				end
				it 'tagフォームが表示される' do
					expect(page).to have_field 'post[tag_list]'
				end
				it '画像フォームが表示される' do
					expect(page).to have_field 'images_attributes[0][image][]'
				end
				it '投稿に成功する' do
					fill_in 'post[title]', with: Faker::Lorem.characters(number:20)
					fill_in 'post[article]', with: Faker::Lorem.characters(number:100)
					fill_in 'post[tag_list]', with: Faker::Lorem.characters(number:5)
					attach_file 'images_attributes[0][image][]', "#{Rails.root}/app/assets/images/book.jpg"
					click_button '送信'
					expect(page).to have_content '投稿が作成されました！'
				end
				it '投稿に失敗する' do
					click_button '送信'
					expect(page).to have_content 'タイトル,コメントを入力してください'
				end
			end
		end
	end
end
