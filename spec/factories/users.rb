FactoryBot.define do

  factory :user do
    email { generate(:email) }
    password { "fake_password" }

    before(:create) { |user| user.skip_confirmation! }

    trait :admin do
      role { :admin }
    end

    trait :org do
      role { :organization }
      organization_id { create(:organization, :approved).id }
    end

  end

end