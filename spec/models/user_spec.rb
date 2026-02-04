require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { build(:user, :email => "new@gmail.com") }

  it "has email" do
    expect(user).to respond_to(:email)
  end

  it "has role" do
    expect(user).to respond_to(:role)
  end

  it "belongs to organization" do
    should belong_to(:organization).optional
  end

  describe "validation tests" do
    
    it "must have the email attribute" do
      should validate_presence_of(:email)
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

    it "must validate email" do
      should allow_value('test@gmail.com').for(:email)
    end

    it "must have the password attribute" do
      should validate_presence_of(:password)
    end

    it "must have a minimum length of 7 for password" do
      should validate_length_of(:password).is_at_least(7)
    end

    it "must have a maximum length of 255 for password" do
      should validate_length_of(:password).is_at_most(255)
    end

    it "must validate password" do
      should allow_value('password123').for(:password)
    end
  
  end

  describe "member function tests" do
  
    it "converts to a string" do
      expect(user.to_s).to eq ("new@gmail.com")
    end

  end

  describe "static function tests" do

    it "has default role" do
      expect(user.role).to eq("organization")
    end
    
  end

end
