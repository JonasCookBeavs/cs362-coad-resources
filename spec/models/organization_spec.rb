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

  describe "validation tests" do
    
    subject { Organization.new }
    
    it "must have these attributes" do
      should validate_presence_of(:email)
      should validate_presence_of(:name)
      should validate_presence_of(:phone)
      should validate_presence_of(:status)
      should validate_presence_of(:primary_name)
      should validate_presence_of(:secondary_name)
      should validate_presence_of(:secondary_phone)
    end

    it "must have a minimum length of 1 for email" do
      should validate_length_of(:email).is_at_least(1)
    end

    it "must have a maximum length of 255 for email" do
      should validate_length_of(:email).is_at_most(255)
    end

    it "must have a properly formatted email" do
      should allow_value('test@gmail.com').for(:email)
    end

    it "must not allow poorly formatted emails" do
      should_not allow_value('email').for(:email)
    end

    it "must have a unique email" do
      should validate_uniqueness_of(:email).case_insensitive
    end

    it "must have a minimum length of 1 for name" do
      should validate_length_of(:name).is_at_least(1)
    end

    it "must have a maximum length of 255 for name" do
      should validate_length_of(:name).is_at_most(255)
    end

    it "must have a unique name" do
      should validate_uniqueness_of(:name).case_insensitive
    end

    it "must validate names" do
      should allow_value('name').for(:name)
    end

    it "must validate phone numbers" do
      should allow_value('+1-555-555-5555').for(:phone)
    end

    it "must validate email" do
      should allow_value('test@gmail.com').for(:email)
    end

    it "must validate primary name" do
      should allow_value('name').for(:primary_name)
    end

    it "must validate secondary name" do
      should allow_value('name').for(:secondary_name)
    end

    it "must validate secondary phone" do
      should allow_value('+1-555-555-5555').for(:secondary_phone)
    end
  
  end

  describe "member function tests" do
    let (:organization_new) { Organization.new(name: "new") }
  
    it "converts to a string" do
      expect(organization_new.to_s).to eq ("new")
    end

  end

  describe "static function tests" do

  it "has default status" do
    org = Organization.new
    expect(org.status).to eq("submitted")
  end

  it "has approved status" do
    org = Organization.new
    org.approve
    expect(org.status).to eq("approved")
  end

  it "has rejected status" do
    org = Organization.new
    org.reject
    expect(org.status).to eq("rejected")
  end

end

end
