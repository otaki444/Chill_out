require 'rails_helper'

RSpec.describe "Admins", type: :system do
	describe "ログイン" do
		context 'ログイン画面に遷移' do
			let(:admin) { create(:admin)}
			before do
				visit new_admin_session_path
			end
			it 'ログイン成功' do
		 		fill_in 'admin[email]', with: admin.email
		 		fill_in 'admin[password]', with: admin.password
		 		click_button 'ログイン'

		 		expect(current_path).to eq(admins_top_path)
			end
			it 'ログイン失敗' do
				fill_in 'admin[email]', with: ""
		 		fill_in 'admin[password]', with: ""
		 		click_button 'ログイン'

		 		expect(current_path).to eq(new_admin_session_path)
			end
		end
	end
	describe '表示テスト' do
		let(:admin) { create(:admin)}
		before do
			visit new_admin_session_path
			fill_in 'admin[email]', with: admin.email
		 	fill_in 'admin[password]', with: admin.password
		 	click_button 'ログイン'
		end
		context 'ヘッダーの表示' do
			it '管理者メニューが表示される' do
				expect(page).to have_content '会員一覧'
				expect(page).to have_content 'ログアウト'
			end
		end
		context '会員情報の表示' do
			it '会員一覧画面が表示される' do
				visit admins_top_path
				click_link '会員一覧', match: :first
				expect(current_path).to eq(admins_users_path)
			end
		end
	end
end
