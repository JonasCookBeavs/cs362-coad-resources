require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { build(:region) }
  # use create if it needs to be in the database for the test, otherwise use build

  it "has a name" do
    expect(region).to respond_to(:name)
  end

  it "has many tickets" do
    should have_many(:tickets)
  end

  describe "validation tests" do

    it "must have the name attribute" do
      should validate_presence_of(:name)
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
  
  end

  describe "member function tests" do

    it "converts to a string" do
      region.name = "Some name"
      expect(region.to_s).to eq ("Some name")
    end

  end

  describe "static function tests" do

    it 'returns a region named Unspecified' do
      region = Region.unspecified
      expect(region.name).to eq('Unspecified')
    end

  end

end
