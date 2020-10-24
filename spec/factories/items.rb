FactoryBot.define do
  factory :item do
    name              {"出品した品物"}
    price             {"1000"} 
    explaination      {"これは説明です。"}
    category_id       {Faker::Number.between(from: 2, to: 10) }  
    status_id         {Faker::Number.between(from: 2, to: 10) } 
    ship_cost_id      {Faker::Number.between(from: 2, to: 10) } 
    ship_location_id  {Faker::Number.between(from: 2, to: 10) } 
    ship_day_id       {Faker::Number.between(from: 2, to: 10) } 
    
    association :user  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
