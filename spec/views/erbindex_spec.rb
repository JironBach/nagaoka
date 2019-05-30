require 'rails_helper'

RSpec.describe "index/index", type: :view do
  #session[:user_id] = 1
  #let(:user) { create :user }
  let(:helper_methods) {
    {
      current_user: :user,
      signed_in?: true #{ :user.id == 1 }
    }
  }
  before { assign(:user, :user) }

  delegate :nl2br, to: 'controller.view_context'

=begin
  it 'レスポンスが成功すること' do
    #define_helper_methods(view, helper_methods)
    render template: 'index/index.html.erb'
    expect(response).to have_http_status(:success)
  end

  it 'ログイン済み' do
    #define_helper_methods(view, helper_methods)
    render template: 'index/index.html.erb'
    if false #!signed_in?
      expect(response.body).to include(nl2br('ログアウト'))
    elsif
      expect(response.body).to include(nl2br('テスト'))
    end
  end
=end

end
