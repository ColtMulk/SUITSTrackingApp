# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/event_types', type: :request do
  # EventType. As you add validations to EventType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'test_event_type' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  before do
    user = User.create(id: 1, role: :master, password: 'password', password_confirmation: 'password', email: 'master@master.com')
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      EventType.create! valid_attributes
      get event_types_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      event_type = EventType.create! valid_attributes
      get event_type_url(event_type)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_event_type_path
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      event_type = EventType.create! valid_attributes
      get edit_event_type_url(event_type)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new EventType' do
        expect do
          post event_types_url, params: { event_type: valid_attributes }
        end.to change(EventType, :count).by(1)
      end

      it 'redirects to the created event_type' do
        post event_types_url, params: { event_type: valid_attributes }
        expect(response).to redirect_to(event_type_url(EventType.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new EventType' do
        expect do
          post event_types_url, params: { event_type: invalid_attributes }
        end.to change(EventType, :count).by(0)
      end

      it 'returns 422 status code' do
        post event_types_url, params: { event_type: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'new_test_event_type' }
      end

      it 'updates the requested event_type' do
        event_type = EventType.create! valid_attributes
        patch event_type_url(event_type), params: { event_type: new_attributes }
        event_type.reload
        expect(event_type.name).to include('new')
      end

      it 'redirects to the event_type' do
        event_type = EventType.create! valid_attributes
        patch event_type_url(event_type), params: { event_type: new_attributes }
        event_type.reload
        expect(response).to redirect_to(event_type_url(event_type))
      end
    end

    context 'with invalid parameters' do
      it 'returns 422 status code' do
        event_type = EventType.create! valid_attributes
        patch event_type_url(event_type), params: { event_type: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested event_type' do
      event_type = EventType.create! valid_attributes
      expect do
        delete event_type_url(event_type)
      end.to change(EventType, :count).by(-1)
    end

    it 'redirects to the event_types list' do
      event_type = EventType.create! valid_attributes
      delete event_type_url(event_type)
      expect(response).to redirect_to(event_types_url)
    end
  end
end
