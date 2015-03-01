FactoryGirl.define do
  factory :charity do
    name     'Oxfam'
    url      'http://oxfam.org'
    start_on Date.today.beginning_of_month.beginning_of_day
    end_on   Date.today.end_of_month.end_of_day
  end
end
