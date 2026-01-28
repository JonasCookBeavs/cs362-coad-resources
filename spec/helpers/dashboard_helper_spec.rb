require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  describe 'test user dashboard' do
    it 'test admin user' do
      admin = User.new(role: 'admin')
      expect(dashboard_for(admin)).to eq('admin_dashboard')
    end

    it 'test organization user and submitted' do
      org = Organization.new()
      user = User.new(organization: org)
      expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
    end

    it 'test organization user and approved' do
      org = Organization.new(status: 'approved')
      user = User.new(organization: org)
      expect(dashboard_for(user)).to eq('organization_approved_dashboard')
    end

    it 'test organization user and rejected' do
      org = Organization.new(status: 'rejected')
      user = User.new(organization: org)
      expect(dashboard_for(user)).to eq('create_application_dashboard')
    end

    it 'test other' do
      user = User.new()
      expect(dashboard_for(user)).to eq('create_application_dashboard')
    end

  end

end
