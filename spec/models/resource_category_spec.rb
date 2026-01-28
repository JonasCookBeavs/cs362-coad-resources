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
  
  describe "validation tests" do
    subject { ResourceCategory.new }

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
    let(:category) { ResourceCategory.new(name: "Resource") }
    let(:active_category) { ResourceCategory.new(active: true) }
    let(:inactive_category) { ResourceCategory.new(active: false) }

    it "converts to a string" do
      expect(category.to_s).to eq ("Resource")
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
      resc_cat = ResourceCategory.unspecified
      expect(resc_cat.name).to eq('Unspecified')
    end

  end

  describe "scope tests" do
    let (:active_category) do
      c = ResourceCategory.new(active: true)
      c.save(validate: false)
      c
    end
    
    let (:inactive_category) do
      c = ResourceCategory.new(active: false)
      c.save(validate: false)
      c
    end
    
    it "scopes active categories" do
      expect(ResourceCategory.active).to include(active_category)
    end

    it "scopes inactive categories" do
      expect(ResourceCategory.inactive).to include(inactive_category)
    end
    
  end

end
