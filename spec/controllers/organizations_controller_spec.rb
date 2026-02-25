require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  describe 'as a logged-out user' do
    let (:user) { create(:user) }
    let (:organization) { create(:organization) }

    it {
      expect(get(:index)).to redirect_to new_user_session_path
    }

    it {
      expect(get(:new)).to redirect_to new_user_session_path
    }

    it {
      post(:create, params: { organization: FactoryBot.attributes_for(:organization) })
      expect(response).to redirect_to new_user_session_path
    }

    it {
      expect(patch(:update, params: { id: organization.id })).to redirect_to new_user_session_path
    }

    it {
      org = build(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:new).and_return(org)
      post(:create, params: { organization: FactoryBot.attributes_for(:organization) })
      expect(response).to redirect_to new_user_session_path
    }

    it {
      org = create(:organization)
      allow(org).to receive(:update).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :update, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to have_http_status(:found)
    }

    it {
      org = create(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :approve, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to redirect_to new_user_session_path
    }

    it {
      org = create(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :reject, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to redirect_to new_user_session_path
    }

  end

  describe 'as a logged-in user' do
    let (:user) { create(:user) }
    let (:organization) { create(:organization) }

    before (:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(get(:new)).to be_successful
    }
  
    # fixed the params but need to find a way for email to have some contents so email.deliver_now passes
    # it {
    #   user = build(:user, :admin)
    #   allow(UserMailer).to receive(:with).and_return(user)
    #   allow(UserMailer).to receive(:new_organization_application).and_return("true")
    #   post(:create, params: { status: :submitted,  organization: FactoryBot.attributes_for(:organization) })
    #   expect(response).to redirect_to dashboard_path
    # }

    it {
      expect(patch(:update, params: { id: organization.id })).to redirect_to dashboard_path
    }

    it {
      org = build(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:new).and_return(org)
      post(:create, params: { organization: FactoryBot.attributes_for(:organization) })
      expect(response).to be_successful
    }

    it {
      org = create(:organization)
      allow(org).to receive(:update).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :update, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to have_http_status(:found)
    }

    it {
      org = create(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :approve, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to redirect_to dashboard_path
    }

    it {
      org = create(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :reject, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to redirect_to dashboard_path
    }

  end

  describe 'as an admin' do
    let (:user) { create(:user, :admin) }
    let (:organization) { create(:organization) }

    before (:each) { sign_in user }

    it {
      expect(get(:index)).to be_successful
    }

    it {
      expect(get(:new)).to redirect_to dashboard_path
    }

    it {
      post(:create, params: { organization: FactoryBot.attributes_for(:organization) })
      expect(response).to redirect_to dashboard_path
    }

    it {
      expect(patch(:update, params: { id: organization.id, organization: FactoryBot.attributes_for(:organization) })).to redirect_to dashboard_path
    }

    it {
      org = build(:organization)
      allow(org).to receive(:save).and_return(false)
      allow(Organization).to receive(:new).and_return(org)
      post(:create, params: { organization: FactoryBot.attributes_for(:organization) })
      expect(response).to redirect_to dashboard_path
    }

    it {
      org = create(:organization)
      allow(org).to receive(:update).and_return(false)
      allow(Organization).to receive(:find).and_return(org)
      patch :update, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
      expect(response).to have_http_status(:found)
    }

    # must fix
    # it {
    #   org = create(:organization)
    #   allow(org).to receive(:save).and_return(false)
    #   allow(Organization).to receive(:find).and_return(org)
    #   patch :approve, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
    #   expect(response).to raise_error(ActionView::MissingTemplate)
    # }

    # it {
    #   org = create(:organization)
    #   allow(org).to receive(:save).and_return(false)
    #   allow(Organization).to receive(:find).and_return(org)
    #   patch :reject, params: { id: org.id, organization: FactoryBot.attributes_for(:organization) }
    #   expect(response).to raise_error(ActionView::MissingTemplate)
    # }

  end
end
