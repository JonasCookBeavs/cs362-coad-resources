FactoryBot.define do

  sequence :email do |n|
    "fakeuser#{n}@fakedomain#{n}.com"
  end

  sequence :phone do |n|
    "+1-555-#{n}" + ("%04d" % n) # or
    "+1-555-" + n.to_s.rjust(4, "0")
  end

  sequence :name do |n|
    "fakename_#{n}"
  end

end