require 'rails_helper'

describe '初期画面', type: :system do
  context '未ログイン' do
=begin
    it '未ログイン時 登録ボタンを表示' do
      visit root_path
      expect(response).to have_http_status(:ok)
      expect(page).to have_content '登録 または ログイン'
    end
=end
  end
end
