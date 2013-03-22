FactoryGirl.define do
  factory :user do
  	sequence(:name)  { |n| "Person #{n}" }
  	sequence(:email) { |n| "person_#{n}@example.com"}
  	password    "c2nn0n11"
  	password_confirmation "c2nn0n11"

  	factory :admin do
  	  admin true
  	end
  end

  factory :micropost do
  	content "Lorem ipsum"
  	user
  end
end
