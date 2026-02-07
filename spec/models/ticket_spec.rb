require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { build(:ticket) }
  let(:open_ticket) { create(:ticket, closed: false, organization_id: nil) }
  let(:closed_ticket) { create(:ticket, closed: true) }
  let(:all_org_ticket) { create(:ticket, closed: false, organization_id: 1) }
  let(:org) { create(:organization) }
  let(:reg) { create(:region) }
  let(:region_ticket) { create(:ticket, region_id: reg.id) }
  let(:resc_cat) { create(:resource_category) }
  let(:resource_ticket) { create(:ticket, resource_category_id: resc_cat.id) }
  
  it "has name" do
    expect(ticket).to respond_to(:name)
  end

  it "has description" do
    expect(ticket).to respond_to(:description)
  end

  it "has phone" do
    expect(ticket).to respond_to(:phone)
  end

  it "has closed" do
    expect(ticket).to respond_to(:closed)
  end

  it "has closed_at" do
    expect(ticket).to respond_to(:closed_at)
  end
  
  it "belongs to region" do
    should belong_to(:region)
  end

  it "belongs to resource_category" do
    should belong_to(:resource_category)
  end

  it "belongs to organization" do
    should belong_to(:organization).optional
  end

  describe "validation tests" do
    
    it "must have these attributes" do
      should validate_presence_of(:name)
      should validate_presence_of(:phone)
      should validate_presence_of(:region_id)
      should validate_presence_of(:resource_category_id)
    end

    it "must validate name length" do
      should allow_value('John Doe').for(:name)
    end

    it "must validate description length" do
      should allow_value('Lorem Ipsum').for(:description)
    end

    it "must validate phone numbers" do
      should allow_value('+1-555-555-5555').for(:phone)
    end
  
  end

  describe "member function tests" do

    it "converts to a string" do
      ticket.id = 123
      expect(ticket.to_s).to eq ("Ticket 123")
    end

    it "is open" do
      expect(ticket.open?).to be true
    end

    it "is closed" do
      ticket.closed = true
      expect(ticket.open?).to be false
    end

    it "is not captured initally" do
      expect(ticket.captured?).to be false
    end

    it "is captured" do
      ticket.organization = Organization.new()
      expect(ticket.captured?).to be true
    end
  end


  # Create multiple let blocks(factories), one for each unique object you need.
  describe "scope tests" do

    it "scopes open tickets" do
      expect(Ticket.open).to include(open_ticket)
    end
    
    it "scopes closed tickets" do
      expect(Ticket.closed).to include(closed_ticket)
    end

    describe "organization scope" do


      it "scopes all organizations" do
        expect(Ticket.all_organization).to include(all_org_ticket)
      end

      it "scopes open tickets by organization" do
        open_ticket.organization_id = org.id
        closed_ticket.organization_id = org.id
        expect(Ticket.organization(org.id)).to include(open_ticket)
        expect(Ticket.organization(org.id)).not_to include(closed_ticket)
      end

    end

    it "scopes region" do
      expect(Ticket.region(reg.id)).to include(region_ticket)
    end

    it "scopes resource category" do
      expect(Ticket.resource_category(resc_cat.id)).to include(resource_ticket)
    end

  end

end
