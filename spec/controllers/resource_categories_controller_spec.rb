require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  
  describe 'as a logged-out user' do
    let (:user) { create(:user) }
    let (:resource_category) { create(:resource_category) }

    it {
      expect(get(:index)).to redirect_to new_user_session_path
    }

    it {
      post(:create, params: { resource_category: FactoryBot.attributes_for(:resource_category) })
      expect(response).to redirect_to new_user_session_path
    }

    it {
      expect(get(:show, params: { id: resource_category.id })).to redirect_to new_user_session_path
    }

    it {
      expect(get(:new)).to redirect_to new_user_session_path
    }

    it {
      expect(get(:edit, params: { id: resource_category.id })).to redirect_to new_user_session_path
    }

    it {
      expect(patch(:update, params: { id: resource_category.id })).to redirect_to new_user_session_path
    }

    it {
      expect(delete(:show, params: { id: resource_category.id })).to redirect_to new_user_session_path
    }

    it {
      res_cat = build(:resource_category)
      allow(res_cat).to receive(:save).and_return(false)
      allow(ResourceCategory).to receive(:new).and_return(res_cat)
      post(:create, params: { resource_category: FactoryBot.attributes_for(:resource_category) })
      expect(response).to redirect_to new_user_session_path
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:update).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :update, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to have_http_status(:found)
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:activate).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :activate, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to redirect_to new_user_session_path
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:deactivate).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :deactivate, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to redirect_to new_user_session_path
    }

  end

  describe 'as a logged-in user' do
    let (:user) { create(:user) }
    let (:resource_category) { create(:resource_category) }

    before (:each) { sign_in user }

    it {
      expect(get(:index)).to redirect_to dashboard_path
    }

    it {
      post(:create, params: { resource_category: FactoryBot.attributes_for(:resource_category) })
      expect(response).to redirect_to dashboard_path
    }

    it {
      expect(get(:show, params: { id: resource_category.id })).to redirect_to dashboard_path
    }

    it {
      expect(get(:new)).to redirect_to dashboard_path
    }

    it {
      expect(get(:edit, params: { id: resource_category.id })).to redirect_to dashboard_path
    }

    it {
      expect(patch(:update, params: { id: resource_category.id })).to redirect_to dashboard_path
    }

    it {
      expect(delete(:show, params: { id: resource_category.id })).to redirect_to dashboard_path
    }

    it {
      res_cat = build(:resource_category)
      allow(res_cat).to receive(:save).and_return(false)
      allow(ResourceCategory).to receive(:new).and_return(res_cat)
      post(:create, params: { resource_category: FactoryBot.attributes_for(:resource_category) })
      expect(response).to redirect_to dashboard_path
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:update).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :update, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to have_http_status(:found)
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:activate).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :activate, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to redirect_to dashboard_path
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:deactivate).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :deactivate, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to redirect_to dashboard_path
    }

  end

  describe 'as an admin' do
    let (:user) { create(:user, :admin) }
    let (:resource_category) { create(:resource_category) }

    before (:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it {
      post(:create, params: { id: resource_category.id, resource_category: FactoryBot.attributes_for(:resource_category) })
      expect(response).to be_successful
    }

    it {
      expect(get(:show, params: { id: resource_category.id })).to be_successful
    }

    it {
      expect(get(:new)).to be_successful
    }

    it {
      expect(get(:edit, params: { id: resource_category.id })).to be_successful
    }

    it {
      expect(patch(:update, params: { id: resource_category.id, resource_category: FactoryBot.attributes_for(:resource_category) })).to redirect_to @resource_category
    }

    it {
      expect(delete(:show, params: { id: resource_category.id })).to be_successful
    }

    it {
      res_cat = build(:resource_category)
      allow(res_cat).to receive(:save).and_return(false)
      allow(ResourceCategory).to receive(:new).and_return(res_cat)
      post(:create, params: { resource_category: FactoryBot.attributes_for(:resource_category) })
      expect(response).to be_successful
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:update).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :update, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to have_http_status(:ok)
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:activate).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :activate, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to redirect_to resource_category_path
    }

    it {
      res_cat = create(:resource_category)
      allow(res_cat).to receive(:deactivate).and_return(false)
      allow(ResourceCategory).to receive(:find).and_return(res_cat)
      patch :deactivate, params: { id: res_cat.id, resource_category: FactoryBot.attributes_for(:resource_category) }
      expect(response).to redirect_to resource_category_path
    }

  end
end
