require 'rails_helper'

describe 'Categories', type: :request do
  let(:vertical) { create :vertical }

  describe 'GET /api/verticals/:vertical_id/categories' do
    let(:make_request) do
      get "/api/verticals/#{vertical.to_param}/categories",
          headers: { format: :json }
    end
    subject { response }

    it 'returns empty array' do
      make_request
      expect(response_data).to eq []
    end

    context 'when vertical exists' do
      let!(:category) { create :category, vertical: vertical }

      it 'serializes resource' do
        make_request
        is_expected.to serialize_resource [category], with: CategorySerializer
      end
    end
  end

  describe 'POST /api/verticals/:vertical_id/categories' do
    let(:make_request) do
      post "/api/verticals/#{vertical.to_param}/categories",
           params: data, headers: { format: :json }
    end

    context 'with valid attributes' do
      let(:data) do
        {
          data: {
            type: 'categories',
            attributes: {
              name: Faker::Science.element
            }
          }
        }
      end

      it 'creates resource' do
        expect { make_request }.to change(Category, :count).by 1
        is_expected.to serialize_resource Category.last,
                                          with: CategorySerializer
        expect(Category.last.vertical).to eq vertical
      end
    end

    context 'with invalid attributes' do
      let(:data) do
        {
          data: {
            type: 'categories',
            attributes: { name: vertical.name }
          }
        }
      end

      it 'serializes errors' do
        make_request
        expect(json).to include 'errors'
      end
    end
  end

  describe 'PATCH /api/categories/:id' do
    let!(:category) { create :category }
    let(:make_request) do
      patch "/api/categories/#{category.to_param}",
            params: data, headers: { format: :json }
    end

    context 'with valid attributes' do
      let(:data) do
        {
          data: {
            type: 'categories',
            attributes: {
              name: Faker::Science.element
            }
          }
        }
      end

      it 'updates resource' do
        expect { make_request }.to change(Category, :count).by 0
        is_expected.to serialize_resource category.reload,
                                          with: CategorySerializer
      end
    end

    context 'with invalid attributes' do
      let(:data) do
        {
          data: {
            type: 'categories',
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

  describe 'DELETE /api/categories/:id' do
    let!(:category) { create :category }
    let(:make_request) do
      delete "/api/categories/#{category.to_param}", headers: { format: :json }
    end

    it 'destroys resource' do
      expect { make_request }.to change(Category, :count).by -1
    end
  end
end