require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject(:organization) { Organization.new }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:phone) }
  it { is_expected.to respond_to(:status) }
  it { is_expected.to respond_to(:primary_name) }
  it { is_expected.to respond_to(:secondary_name) }
  it { is_expected.to respond_to(:secondary_phone) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:rejection_reason) }
  it { is_expected.to respond_to(:liability_insurance) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:transportation) }
  it { is_expected.to respond_to(:approve) }
  it { is_expected.to respond_to(:reject) }
  it { is_expected.to respond_to(:to_s) }
  it { is_expected.to respond_to(:set_default_status) }

end
