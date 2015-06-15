require 'rails_helper'
require 'support/controller_macros'

RSpec.describe DocumentsController, type: :controller do
  describe 'GET #index' do
    context 'authenticated user' do
      it ' allows access ' do
        login_user
        get :index
        expect(response).to be_succes
      end
    end
    context 'guest user' do
      it 'does not allow acces' do
        get :index
       expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


  describe 'DOCUMENT #create' do
    context 'with valid attributes' do
      it 'creates documents' do
        document = create(:document)
        expect(Document.count).to eq 1
      end
      it 'has status 200' do
        document = create(:document)
        expect(response.status).to eq 200
      end
    end
    context 'with invalid attributes' do
      it 'does not create document' do
        document = build(:document, title: nil)
        expect(Document.count).to eq 0
      end
    end
  end
end
