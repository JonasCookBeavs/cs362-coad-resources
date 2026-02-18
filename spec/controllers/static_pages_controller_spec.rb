require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'as a user' do
    it "returns a http success" do
      expect(get(:index)).to have_http_status(:success)
    end
  end
end
