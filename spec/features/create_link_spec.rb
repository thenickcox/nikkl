require 'spec_helper'
require 'load_rails'

describe 'creating a link', type: :feature, js: true do
  context 'happy path' do
    it 'creates a link successfully' do
      visit '/'
      fill_in 'link-input', with: 'http://google.com'
      click_button 'Go'
      expect(page).to have_content 'Your link is'
      expect(page).to have_content Link.last.slug
    end
  end

  context 'errors' do
    it 'displays an error message' do
      visit '/'
      fill_in 'link-input', with: 'kittens'
      click_button 'Go'
      expect(page).to have_content I18n.t('models.link.errors.url')
    end
  end
end
