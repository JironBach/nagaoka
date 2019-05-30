require 'rails_helper'

describe User, type: :model do
  random = Random.new()

  before do
    begin
    rescue
    end
  end

  context '名前は必須' do
    it '名前がない場合は偽' do
      user_f = User.create()
      user_f.valid?
      #expect(user_f.errors[:name]).to include("can't be blank")      end
      expect(user_f).not_to be_valid
    end

    it '名前が重複している場合は偽' do
      user_t = create(:user, name: 'hoge')
      expect(user_t).to be_valid
      expect{ create(:user, name: 'hoge') }.to raise_error()
    end
  end

end
