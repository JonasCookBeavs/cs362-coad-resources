require 'rails_helper'

RSpec.describe Organization, type: :model do
  
  it "has an email" do
    organization = Organization.new
    expect(organization).to respond_to(:email)
  end

  it "has a name" do
    organization = Organization.new
    expect(organization).to respond_to(:name)
  end

  it "has a phone" do
    organization = Organization.new
    expect(organization).to respond_to(:phone)
  end

  it "has a status" do
    organization = Organization.new
    expect(organization).to respond_to(:status)
  end

  it "has a primary name" do
    organization = Organization.new
    expect(organization).to respond_to(:primary_name)
  end

  it "has a secondary name" do
    organization = Organization.new
    expect(organization).to respond_to(:secondary_name)
  end

  it "has a secondary phone" do
    organization = Organization.new
    expect(organization).to respond_to(:secondary_phone)
  end

  it "has a description" do
    organization = Organization.new
    expect(organization).to respond_to(:description)
  end

  it "has a rejection reason" do
    organization = Organization.new
    expect(organization).to respond_to(:rejection_reason)
  end

  it "has liability insurance" do
    organization = Organization.new
    expect(organization).to respond_to(:liability_insurance)
  end

  it "has a title" do
    organization = Organization.new
    expect(organization).to respond_to(:title)
  end

  it "has transportation" do
    organization = Organization.new
    expect(organization).to respond_to(:transportation)
  end

  it "has many tickets" do
    should have_many(:tickets)
  end

  it "has many users" do
    should have_many(:users)
  end

  it "has and belongs to resource categories" do
    should have_and_belong_to_many(:resource_categories)
  end

end
