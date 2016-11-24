FactoryGirl.define do
  factory :location do
    zip_code 1
    zip_code_type "MyString"
    city "MyString"
    state "MyString"
    lat 1.5
    lng 1.5
    country "MyString"
    location_text "MyString"
    location "MyString"
    estimated_population 1
    total_wages "9.99"
  end
end
