require 'rails_helper'

describe 'Courses', type: :request do
  let(:category) { create :category }

  describe 'GET /api/categories/:category_id/courses' do
    let(:make_request) do
      get "/api/categories/#{category.to_param}/courses",
          headers: { format: :json }
    end
    subject { response }

    it 'returns empty array' do
      make_request
      expect(response_data).to eq []
    end

    context 'when course exists' do
      let!(:course) { create :course, category: category }

      it 'serializes resource' do
        make_request
        is_expected.to serialize_resource [course], with: CourseSerializer
      end
    end
  end

  describe 'POST /api/categories/:category_id/courses' do
    let(:make_request) do
      post "/api/categories/#{category.to_param}/courses",
           params: data, headers: { format: :json }
    end

    context 'with valid attributes' do
      let(:data) do
        {
          data: {
            type: 'courses',
            attributes: {
              name: Faker::Job.title,
              author: Faker::FunnyName.name
            }
          }
        }
      end

      it 'creates resource' do
        expect { make_request }.to change(Course, :count).by 1
        is_expected.to serialize_resource Course.last,
                                          with: CourseSerializer
        expect(Course.last.category).to eq category
      end
    end

    context 'with invalid attributes' do
      let(:data) do
        {
          data: {
            type: 'categories',
            attributes: {
              name: "",
              author: ""
            }
          }
        }
      end

      it 'serializes errors' do
        make_request
        expect(json).to include 'errors'
      end
    end
  end

  describe 'PATCH /api/courses/:id' do
    let!(:course) { create :course }
    let(:make_request) do
      patch "/api/courses/#{course.to_param}",
            params: data, headers: { format: :json }
    end

    context 'with valid attributes' do
      let(:data) do
        {
          data: {
            type: 'categories',
            attributes: {
              name: Faker::Job.title,
              author: Faker::FunnyName.name
            }
          }
        }
      end

      it 'updates resource' do
        expect { make_request }.to change(Category, :count).by 0
        is_expected.to serialize_resource course.reload,
                                          with: CourseSerializer
      end
    end

    context 'with invalid attributes' do
      let(:data) do
        {
          data: {
            type: 'courses',
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

  describe 'DELETE /api/courses/:id' do
    let!(:course) { create :course }
    let(:make_request) do
      delete "/api/courses/#{course.to_param}", headers: { format: :json }
    end

    it 'destroys resource' do
      expect { make_request }.to change(Course, :count).by -1
    end
  end
end