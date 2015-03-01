require 'spec_helper'

describe 'creating a link', type: :feature do
  before do
    allow(Link).to receive(:count_in_featured_period).and_return(500)
    FactoryGirl.create :charity
    visit '/'
  end

  it 'shows featured charity' do
    expect(page).to have_content "This month's featured charity is #{Charity.last.name}."
  end

  it 'shows how much money has been raised' do
    expect(page).to have_content "We have raised $25.00 for #{Charity.last.name} this month"
  end
end
