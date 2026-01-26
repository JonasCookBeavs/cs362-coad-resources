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

#   describe "scope test" do
#     let (:ticket) { Ticket.new() }
#     t = Ticket.new
#     t.save(validate: false)
#     t
#     end

#     it "scopes open tickets" do
#       expect(Ticket.open).to include(ticket)
#     end

#     # Build tickets that match the 'where' sections in the scope
    
#   end

end
