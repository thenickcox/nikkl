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
    Charity.create!(charity_attrs)
    visit '/'
  end

  it 'shows featured charity' do
    page.should have_content "This month's featured charity is #{Charity.last.name}."
  end

end
