require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "has email" do
    user = User.new
    expect(user).to respond_to(:email)
  end

  it "has role" do
    user = User.new
    expect(user).to respond_to(:role)
  end

  it "belongs to organization" do
    should belong_to(:organization).optional
  end

end
