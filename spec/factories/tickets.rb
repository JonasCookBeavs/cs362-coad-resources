FactoryBot.define do

  factory :ticket do
    name
    phone { "+1-555-555-5555" }
    association :region
    association :resource_category
  end

end