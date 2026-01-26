require 'rails_helper'

RSpec.describe Region, type: :model do

  it "has a name" do
    region = Region.new
    expect(region).to respond_to(:name)
  end

  it "has a string representation that is its name" do
    name = 'Mt. Hood'
    region = Region.new(name: name)
    result = region.to_s
  end

  it "has many tickets" do
    should have_many(:tickets)
  end

  describe "validation tests" do
    
    subject { Region.new }
    
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
    let (:region_new) { Ticket.new(name: "new") }
  
    it "converts to a string" do
      expect (region_new.to_s).to eq ("new")
    end

  end

end
