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

end
