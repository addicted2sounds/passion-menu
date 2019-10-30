require 'rails_helper'

describe 'Verticals', type: :request do
  describe 'GET /api/verticals' do
    let(:make_request) do
      get '/api/verticals', headers: { format: :json }
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
      post '/api/verticals', params: data, headers: { format: :json }
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
end