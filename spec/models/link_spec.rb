require 'load_rails'
require 'spec_helper'

describe Link do

  describe 'validations' do
    let(:link) { described_class.new }
    it { expect(link).to allow_value('http://google.com').for(:url) }
    it { expect(link).not_to allow_value('puppies').for(:url) }
  end

  describe 'errors' do
    let(:link) { Link.new(url: 'pizza') }
    subject { link.save }
    context 'saving an invalid link' do
      it 'adds to errors hash' do
        subject
        expect(link.errors[:url].first).to eq I18n.t('models.link.errors.url')
      end
    end
  end
end
