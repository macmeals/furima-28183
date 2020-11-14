FactoryBot.define do
  factory :order_sold do
    number                {"4242424242424242"}
    exp_month             {"4"}
    exp_year              {"10"}
    cvc                   {"123"}
    token                 {"kejduebair235"}
    post_code             {"123-4567"}
    prefecture_id         {"3"}
    city                  {"横浜市"}
    house_address         {"架空町3−１"}
    tell_number           {"09011112222"}
  end
end
