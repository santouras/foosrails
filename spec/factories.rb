FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    points 500

    factory :admin do
      admin true
    end
  end

  factory :game do
    weight 20
    user1 factory: :user
    user2 factory: :user
    points 0
  end
end