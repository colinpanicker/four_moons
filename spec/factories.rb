FactoryGirl.define do
factory :user do
  sequence(:name) { |n| "Person #{n}" }
  sequence(:email) { |n| "person_#{n}@example.com"}
  password "foobar"
  password_confirmation "foobar"
end

 factory :stream do
  stream_id "1"
  stream_name "Mathematics"
  stream_table_name "Mathematics" 
 end
 
 factory :question do
  content "Lorem ipsum"
  stream_id "2"
  user
end

end
