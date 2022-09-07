require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end

    it 'it renders index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'it response body includes correct placeholder text.' do
      get '/users'
      expect(response.body).to include('This page will display all the users')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  it 'it renders show template' do
    get '/users/show'
    expect(response).to render_template(:show)
  end

  it 'it response body includes correct placeholder text.' do
    get '/users/show'
    expect(response.body).to include('This page will show a single user')
  end
end
