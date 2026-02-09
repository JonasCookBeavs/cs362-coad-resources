FactoryBot.define do

  factory :organization do
    sequence(:name) { |n| "Organization ##{n}" }
    email { "fake@gmail.com" }
    phone { "+1-555-555-5555" }
    primary_name { "Fake primary name" }
    secondary_name { "Fake secondary name" }
    secondary_phone { "+1-444-444-4444" }
  end

end