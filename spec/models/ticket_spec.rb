require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
  it "has name" do
    ticket = Ticket.new
    expect(ticket).to respond_to(:name)
  end

  it "has description" do
    ticket = Ticket.new
    expect(ticket).to respond_to(:description)
  end

  it "has phone" do
    ticket = Ticket.new
    expect(ticket).to respond_to(:phone)
  end

  it "has closed" do
    ticket = Ticket.new
    expect(ticket).to respond_to(:closed)
  end

  it "has closed_at" do
    ticket = Ticket.new
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
    
    subject { Ticket.new }
    
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
    let(:ticket_123) { Ticket.new(id: 123) }
    let(:closed_ticket) { Ticket.new(closed: true) }

    let(:org) { Organization.new() }
    let(:captured_ticket) { Ticket.new(organization: org) }

    it "converts to a string" do
      expect(ticket_123.to_s).to eq ("Ticket 123")
    end

    it "is open" do
      expect(ticket_123.open?).to be true
    end

    it "is closed" do
      expect(closed_ticket.open?).to be false
    end

    it "is not captured initally" do
      expect(ticket_123.captured?).to be false
    end

    it "is captured" do
      expect(captured_ticket.captured?).to be true
    end
  end


  # Create multiple let blocks(factories), one for each unique object you need.
  describe "scope tests" do
    let (:open_ticket) do
      t = Ticket.new(closed: false, organization_id: nil)
      t.save(validate: false)
      t
    end

    let (:closed_ticket) do
      t = Ticket.new(closed: true)
      t.save(validate: false)
      t
    end

    it "scopes open tickets" do
      expect(Ticket.open).to include(open_ticket)
    end
    
    it "scopes closed tickets" do
      expect(Ticket.closed).to include(closed_ticket)
    end

    describe "organization scope" do
      let(:org) do
        o = Organization.new
        o.save(validate: false)
        o
      end

      let (:all_org_ticket) do
        t = Ticket.new(closed: false, organization_id: 1)
        t.save(validate: false)
        t
      end
      
      let(:open_ticket) do
        t = Ticket.new(closed: false, organization_id: org.id)
        t.save(validate: false)
        t
      end

      let(:closed_ticket) do
        t = Ticket.new(closed: true, organization_id: org.id)
        t.save(validate: false)
        t
      end

      it "scopes all organizations" do
        expect(Ticket.all_organization).to include(all_org_ticket)
      end

      it "scopes open tickets by organization" do
        expect(Ticket.organization(org.id)).to include(open_ticket)
        expect(Ticket.organization(org.id)).not_to include(closed_ticket)
      end

    end

    let (:reg) do
      r = Region.new
      r.save(validate: false)
      r
    end

    let (:region_ticket) do
      t = Ticket.new(region_id: reg.id)
      t.save(validate: false)
      t
    end

    it "scopes region" do
      expect(Ticket.region(reg.id)).to include(region_ticket)
    end

    let (:resc_cat) do
      re = ResourceCategory.new
      re.save(validate: false)
      re
    end

    let (:resource_ticket) do
      t = Ticket.new(resource_category_id: resc_cat.id)
      t.save(validate: false)
      t
    end

    it "scopes resource category" do
      expect(Ticket.resource_category(resc_cat.id)).to include(resource_ticket)
    end

  end

end
