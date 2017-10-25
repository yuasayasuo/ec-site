require 'rails_helper'

RSpec.describe '商品一覧', type: :request do
  describe 'GET /books' do
    context 'ログインしていない場合' do
      it 'ログイン画面へリダイレクトすること' do
        get books_path
        expect(response).to redirect_to(:new_user_session)
      end
    end
    
    context 'ログインしている場合' do
      let(:user) { User.create(email: 'test@sample.com', password: 'password') }
      
      before do
        login_as user
      end
      
      it '商品一覧が表示されること' do
        get books_path
        expect(response.body).to include("#{user.email}")
      end
    end
  end
end
