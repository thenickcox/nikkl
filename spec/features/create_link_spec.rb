require 'spec_helper'
require 'load_rails'

describe 'creating a link', type: :feature, js: true do
  it 'creates a link successfully' do
    visit '/'
    fill_in 'link-input', with: 'http://google.com'
    click_button 'Go'
    expect(page).to have_content 'Your link is'
  end
end
