require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  
  let(:resource_category) { build(:resource_category) }
  let(:active_category)   { create(:resource_category, active: true) }
  let(:inactive_category) { create(:resource_category, active: false) }

  it "has a name" do
    expect(resource_category).to respond_to(:name)
  end

  it "has active" do
    expect(resource_category).to respond_to(:active)
  end

  it "has and belongs to organizations" do
    should have_and_belong_to_many(:organizations)
  end

  it "has many tickets" do
    should have_many(:tickets)
  end
  
  describe "validation tests" do

    it "must have name" do
      should validate_presence_of(:name)
    end

    it "must validate name length" do
      should allow_value('Example Name').for(:name)
    end

    it "must validate uniqueness of name" do
      should validate_uniqueness_of(:name).case_insensitive
    end

  end

  describe "function tests" do

    it "converts to a string" do
      resource_category.name = "Resource"
      expect(resource_category.to_s).to eq ("Resource")
    end

    it "detects activity" do
      expect(active_category.inactive?).to eq false
    end

    it "detects inactivity" do
      expect(inactive_category.inactive?).to eq true
    end

    it "correctly updates activity" do
      inactive_category.activate
      expect(inactive_category.inactive?).to eq false
    end

    it "correctly updates inactivity" do
      active_category.deactivate
      expect(active_category.inactive?).to eq true
    end

  end

  describe "static function tests" do

    it 'returns a resource_category named Unspecified' do
      unspecified_resc_cat = ResourceCategory.unspecified
      expect(unspecified_resc_cat.name).to eq('Unspecified')
    end

  end

  describe "scope tests" do

    it "scopes active categories" do
      expect(ResourceCategory.active).to include(active_category)
    end

    it "scopes inactive categories" do
      expect(ResourceCategory.inactive).to include(inactive_category)
    end
    
  end

end
