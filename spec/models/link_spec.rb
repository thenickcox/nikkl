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

  describe '#in_featured_period' do
    subject { described_class.in_featured_period }
    let(:link) { Link.create(url: 'http://google.com') }
    before do
      link
      link.update_attribute(:created_at, created_at)
    end

    context 'created_at within period' do
      let(:created_at) { Date.today.beginning_of_month.beginning_of_day + 1.second }
      it 'counts link' do
        expect(subject).to include link
      end
    end
    context 'created_at outside of period' do
      let(:created_at) { Date.today.end_of_month.end_of_day + 1.second }
      it 'does not count link' do
        expect(subject).not_to include link
      end
    end
  end
end
