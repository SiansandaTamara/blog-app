require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'it renders index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'it response body includes correct placeholder text.' do
      get root_path
      expect(response.body).to include('BlogApp')
    end
  end
end
