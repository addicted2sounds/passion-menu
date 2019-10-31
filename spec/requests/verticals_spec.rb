require 'rails_helper'

describe 'Verticals', type: :request do
  let(:user) { create :user }

  describe 'GET /api/verticals' do
    let(:make_request) do
      get '/api/verticals', headers: auth_headers(user)
    end
    subject { response }

    it 'returns empty array' do
      make_request
      expect(response_data).to eq []
    end

    context 'when vertical exists' do
      let!(:vertical) { create :vertical }

      it 'serializes resource' do
        make_request
        is_expected.to serialize_resource [vertical], with: VerticalSerializer
      end
    end
  end

  describe 'POST /api/verticals' do
    let(:make_request) do
      post '/api/verticals', params: data, headers: auth_headers(user)
    end

    context 'with valid attributes' do
      let(:data) do
        {
          data: {
            type: 'verticals',
            attributes: {
              name: Faker::Science.element
            }
          }
        }
      end

      it 'creates resource' do
        expect { make_request }.to change(Vertical, :count).by 1
        is_expected.to serialize_resource Vertical.last,
                                          with: VerticalSerializer
      end
    end

    context 'with invalid attributes' do
      let(:data) do
        {
          data: {
            type: 'verticals',
            attributes: { name: '' }
          }
        }
      end

      it 'serializes errors' do
        make_request
        expect(json).to include 'errors'
      end
    end
  end

  describe 'PATCH /api/verticals/:id' do
    let!(:vertical) { create :vertical }
    let(:make_request) do
      patch "/api/verticals/#{vertical.to_param}",
            params: data, headers: auth_headers(user)
    end

    context 'with valid attributes' do
      let(:data) do
        {
          data: {
            type: 'verticals',
            attributes: {
              name: Faker::Science.element
            }
          }
        }
      end

      it 'updates resource' do
        expect { make_request }.to change(Vertical, :count).by 0
        is_expected.to serialize_resource vertical.reload,
                                          with: VerticalSerializer
      end
    end

    context 'with invalid attributes' do
      let(:data) do
        {
          data: {
            type: 'verticals',
            attributes: { name: '' }
          }
        }
      end

      it 'serializes errors' do
        make_request
        expect(json).to include 'errors'
      end
    end
  end

  describe 'DELETE /api/verticals/:id' do
    let!(:vertical) { create :vertical }
    let(:make_request) do
      delete "/api/verticals/#{vertical.to_param}", headers: auth_headers(user)
    end

    it 'destroys resource' do
      expect { make_request }.to change(Vertical, :count).by -1
    end
  end
end