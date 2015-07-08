FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@example.com"}
    password('12345678')
  end

  factory(:listing) do
    title('Mansion')
    description('A really big house')
    location('Portland')
  end
end
