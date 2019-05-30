require 'rails_helper'

describe User, type: :model do
  random = Random.new()

  before do
    begin
    rescue
    end
  end

  context '名前は必須' do
    let(:user_f) { User.create }
    it '名前がない場合は偽' do
      #expect(user_f.errors[:name]).to include("can't be blank")
      expect(user_f).not_to be_valid
    end

    let(:user_t) { User.create(name: 'hoge') }
    it '名前が重複している場合は偽' do
      expect(user_t).to be_valid
      expect{ create(:user, name: 'hoge') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
