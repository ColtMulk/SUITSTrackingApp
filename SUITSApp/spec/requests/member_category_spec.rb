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

RSpec.describe '/member_categories', category: :request do
  # MemberCategory. As you add validations to MemberCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do {
    name: "good_test",
    default_for: 0
  } 
  end

  let(:invalid_attributes) do {
    name: nil,
    default_for: 0
  } 
  end

  before(:each) do
    user = User.create(role: :master,password:'password',password_confirmation:'password',email:'master@master.com')
    sign_in user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      MemberCategory.create! valid_attributes
      get member_categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      member_category = MemberCategory.create! valid_attributes
      get member_category_url(member_category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_member_category_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      member_category = MemberCategory.create! valid_attributes
      get edit_member_category_url(member_category)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new MemberCategory' do
        expect do
          post member_categories_url, params: { member_category: valid_attributes }
        end.to change(MemberCategory, :count).by(1)
      end

      it 'redirects to the created member_category edit page' do
        post member_categories_url, params: { member_category: valid_attributes }
        expect(response).to redirect_to(edit_member_category_url(MemberCategory.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new MemberCategory' do
        expect do
          post member_categories_url, params: { member_category: invalid_attributes }
        end.to change(MemberCategory, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post member_categories_url, params: { member_category: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do {
        name: "new_name",
        default_for: 0
      } 
      end

      it 'updates the requested member_category' do
        member_category = MemberCategory.create! valid_attributes
        patch member_category_url(member_category), params: { member_category: new_attributes }
        member_category.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the member_category edit page' do
        member_category = MemberCategory.create! valid_attributes
        patch member_category_url(member_category), params: { member_category: new_attributes }
        member_category.reload
        expect(response).to redirect_to(edit_member_category_url(member_category))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        member_category = MemberCategory.create! valid_attributes
        patch member_category_url(member_category), params: { member_category: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested member_category' do
      member_category = MemberCategory.create! valid_attributes
      expect do
        delete member_category_url(member_category)
      end.to change(MemberCategory, :count).by(-1)
    end

    it 'redirects to the member_categories list' do
      member_category = MemberCategory.create! valid_attributes
      delete member_category_url(member_category)
      expect(response).to redirect_to(member_categories_url)
    end
  end
end