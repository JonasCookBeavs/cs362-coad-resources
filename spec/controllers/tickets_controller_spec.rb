require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe 'as a logged-out user' do
    let (:user) { create(:user) }
    let (:ticket) { create(:ticket) }

    it {
      post(:create, params: { ticket: FactoryBot.attributes_for(:ticket) })
      expect(response).to be_successful
    }

    it {
      expect(get(:show, params: { id: ticket.id })).to redirect_to new_user_session_path
    }

    it {
      expect(get(:new)).to be_successful
    }

  end

  describe 'as a logged-in user' do
    let (:user) { create(:user) }
    let (:ticket) { create(:ticket) }

    before (:each) { sign_in user }

    it {
      post(:create, params: { ticket: FactoryBot.attributes_for(:ticket) })
      expect(response).to be_successful
    }

    it {
      expect(get(:show, params: { id: ticket.id })).to redirect_to dashboard_path
    }

    it {
      expect(get(:new)).to be_successful
    }

  end

  describe 'as an admin' do
    let (:user) { create(:user, :admin) }
    let (:ticket) { create(:ticket) }

    before (:each) { sign_in user }

    it {
      post(:create, params: { ticket: FactoryBot.attributes_for(:ticket) })
      expect(response).to be_successful
    }

    # Skip for now
    # it {
    #   expect(get(:show, params: { id: ticket.id })).to be_successful
    # }

    it {
      expect(get(:new)).to be_successful
    }

  end
end
