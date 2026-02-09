FactoryBot.define do

  factory :ticket do
    sequence(:name) { |n| "Ticket ##{n}" }
    phone { "+1-555-555-5555" }
    association :region
    association :resource_category
  end

end