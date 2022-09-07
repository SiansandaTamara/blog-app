require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end

    it 'it renders index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'it response body includes correct placeholder text.' do
      get '/users/1/posts'
      expect(response.body).to include('This a page to display posts')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end
  end

  it 'it renders show template' do
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
  end

  it 'it response body includes correct placeholder text.' do
    get '/users/1/posts/1'
    expect(response.body).to include('This page will be showing single posts')
  end
end
