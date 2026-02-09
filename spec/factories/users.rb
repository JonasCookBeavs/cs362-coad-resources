FactoryBot.define do

  factory :user do
    email { generate(:email) }
    password { "fake_password" }

    before(:create) { |user| user.skip_confirmation! }

    trait :admin do
      role { :admin }
    end
  end

end