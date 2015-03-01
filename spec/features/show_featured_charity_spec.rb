require 'spec_helper'
require 'load_rails'

describe 'creating a link', type: :feature do
  let(:charity_attrs) {{
    name: 'Oxfam',
    url: 'http://oxfam.org',
    start_on: Date.today.beginning_of_month.beginning_of_day,
    end_on: Date.today.end_of_month.end_of_day
  }}

  before do
    allow(Link).to receive(:count_in_featured_period).and_return(500)
    Charity.create!(charity_attrs)
    visit '/'
  end

  it 'shows featured charity' do
    expect(page).to have_content "This month's featured charity is #{Charity.last.name}."
  end

  it 'shows how much money has been raised' do
    expect(page).to have_content "We have raised $25.00 for #{Charity.last.name} this month"
  end
end
