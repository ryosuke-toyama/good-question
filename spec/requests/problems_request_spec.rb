require 'rails_helper'

RSpec.describe 'Problems', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/problems/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/problems/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
