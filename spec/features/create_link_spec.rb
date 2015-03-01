require 'spec_helper'

describe 'creating a link', type: :feature, js: true do
  before do
    visit '/'
    fill_in 'link-input', with: url
    click_button 'Go'
  end

  context 'happy path' do
    let(:url) { 'http://google.com' }
    it 'creates a link successfully' do
      expect(page).to have_content 'Your link is'
      expect(page).to have_content Link.last.slug
    end
  end

  context 'errors' do
    let(:url) { 'kittens' }
    it 'displays an error message' do
      visit '/'
      fill_in 'link-input', with: 'kittens'
      click_button 'Go'
      expect(page).to have_content I18n.t('models.link.errors.url')
    end
  end
end
