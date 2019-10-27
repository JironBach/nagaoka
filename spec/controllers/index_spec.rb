require 'rails_helper'

describe IndexController, type: :controller do
  random = Random.new()

  before do
    begin
    rescue
    end
  end

  context 'GET #index' do
    it 'indexを表示' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  context 'GET #logout' do
    it 'logoutを表示' do
      get 'sign_out!'
      expect(response).to redirect_to('/')
    end
  end

=begin
  context 'GET #index/0' do
    it 'index/0を表示' do
      get :show
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
=end

  context 'POST #regist' do
    it '名前なしで登録' do
      post :regist
      expect(response).to redirect_to root_path
    end

    it '名前ありで登録' do
      post :regist, params:{ username: 'hoge' }
      expect(response).to redirect_to'/index/'
    end
  end

  context 'POST #login' do
    it '名前なしでログイン' do
      post :login
      expect(response).to redirect_to root_path
    end

    it '名前あり、名前がマッチせず' do
      post :login, params:{ username: 'hoge' }
      expect(response).to have_http_status(:success)
    end

    it '名前あり、名前がマッチ' do
      post :login, params:{ username: 'test' }
      #expect(response).to have_http_status(302)
    end
  end

end
