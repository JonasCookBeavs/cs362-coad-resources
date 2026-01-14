require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  
  it "has a name" do
    resource_category = ResourceCategory.new
    expect(resource_category).to respond_to(:name)
  end

  it "has active" do
    resource_category = ResourceCategory.new
    expect(resource_category).to respond_to(:active)
  end

  it "has and belongs to organizations" do
    should have_and_belong_to_many(:organizations)
  end

  it "has many tickets" do
    should have_many(:tickets)
  end
  
end
