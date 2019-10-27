require 'rails_helper'

describe 'indexのrequest', type: :request do
  context 'GET /' do
    it '/を表示' do
      get '/'
      expect(response).to render_template(:index)
    end
  end
end
