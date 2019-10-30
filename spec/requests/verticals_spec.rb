require 'rails_helper'

describe 'Verticals', type: :request do
  describe 'GET /api/verticals' do
    let(:make_request) do
      get '/api/verticals', headers: { format: :json }
    end
    subject { response_data }

    it 'returns empty array' do
      make_request
      is_expected.to eq []
    end

    context 'when vertical exists' do
      let!(:vertical) { create :vertical }

      it 'serializes resource' do
        make_request
        is_expected.to serialize_resource [vertical], with: VerticalSerializer
      end
    end
  end
end