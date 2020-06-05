require 'rails_helper'

RSpec.describe "Users", type: :system do
	describe "ログイン" do
		context 'ログイン画面' do
			let(:user) { create(:user)}
			before do
				visit new_user_session_path
			end
			it 'ログイン成功' do
		 		fill_in 'user[email]', with: user.email
		 		fill_in 'user[password]', with: user.password
		 		click_button 'ログイン'
		 		expect(current_path).to eq(posts_path)
			end
			it 'ログイン失敗' do
				fill_in 'user[email]', with: ""
		 		fill_in 'user[password]', with: ""
		 		click_button 'ログイン'
		 		expect(current_path).to eq(new_user_session_path)
			end
		end
	end

	describe '新規登録' do
		context '新規登録画面' do
			let(:user) { create(:user)}
			before do
				visit new_user_registration_path
			end
		 	it '成功' do
		 		fill_in 'user[name]', with: user.name
		 		fill_in 'user[name_kana]', with: user.name_kana
		 		fill_in 'user[nickname]', with: user.nickname
		 		fill_in 'user[email]', with: user.email
		 		fill_in 'user[password]', with: user.password
		 		fill_in 'user[password_confirmation]', with: user.password
		 		click_button '登録'
		 		expect(current_path).to eq(user_registration_path)
		 	end
		 	it '失敗' do
		 		fill_in 'user[name]', with: ""
		 		fill_in 'user[name_kana]', with: ""
		 		fill_in 'user[nickname]', with: ""
		 		fill_in 'user[email]', with: ""
		 		fill_in 'user[password]', with: ""
		 		fill_in 'user[password_confirmation]', with: ""
		 		click_on '新規登録'
		 		expect(current_path).to eq(new_user_registration_path)
		 	end
		 end
	end

	describe '表示テスト' do
		let!(:user) { create(:user) }
		before do
			visit new_user_session_path
		end
		context 'ヘッダー' do
			it 'ヘッダーメニュー' do
				fill_in 'user[email]', with: user.email
		 		fill_in 'user[password]', with: user.password
		 		click_button 'ログイン'
		 		visit posts_path

				expect(page).to have_content 'マイページ'
				expect(page).to have_content 'ログアウト'
				expect(page).to have_content 'お問い合わせ'
			end
		end
	end

	describe 'マイページテスト' do
		let!(:user) { create(:user) }
		before do
			visit new_user_session_path
			fill_in 'user[email]', with: user.email
	  		fill_in 'user[password]', with: user.password
	  		click_button 'ログイン'
	  	end
	  	context '表示の確認' do
			it 'マイページの表示' do
				visit posts_path
				click_on 'マイページ'
				expect(current_path).to eq(user_path(user.id))
			end
			it 'マイページ編集画面を表示する' do
				visit user_path(user)
				click_on class: 'fas fa-user-edit'
				expect(current_path).to eq(edit_user_path(user.id))
			end
		end
		context '登録内容の編集' do
			it '登録内容を変更に成功する' do
				visit edit_user_path(user.id)
				fill_in 'user[name]', with: user.name
				fill_in 'user[name_kana]', with: user.name_kana
				fill_in 'user[nickname]', with: user.nickname
				click_on '変更する'
				expect(page).to have_content '登録内容を変更しました'
			end
			it '登録内容を変更に失敗する' do
				visit edit_user_path(user.id)
				fill_in 'user[name]', with: ""
				fill_in 'user[email]', with: ""
				click_on '変更する'
				expect(page).to have_content '変更に失敗しました'
			end
		end
	end
end
