FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    points 500
  end

  factory :game do
    weight 20
    user1 { FactoryGirl.create :user }
    user2 { FactoryGirl.create :user }
    points 0
  end
end