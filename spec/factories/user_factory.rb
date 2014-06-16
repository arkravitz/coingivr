FactoryGirl.define do
  factory :user do
    full_name "John Doe"
    email "cooluser@gmail.com"
    username "johndoe"
    password "securepass"
    password_confirmation "securepass"
    admin false

    # create a user with pages
    factory :user_with_pages do
      transient do
        page_count = 5
      end

      after(:create) do |user, evaluator|
        create_list(:give_page, evaluator.page_count, user: user)
      end
    end


  end
end
