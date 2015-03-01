require 'spec_helper'
require 'load_rails'

describe Charity do

  describe 'factory' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:charity)).to be_valid
    end
  end

  describe 'validations' do
    %i(name url start_on end_on).each do |field|
      it { should validate_presence_of field }
    end
  end

  describe '#featured' do
    let(:charity) { Charity.create(name: 'kitten charity', url: 'puppies', start_on: start_on, end_on: end_on) }
    before  { charity }
    subject { described_class.featured }
    context 'date is inside of range' do
      let(:start_on) { Date.today.beginning_of_month.beginning_of_day }
      let(:end_on)   { Date.today.end_of_month.beginning_of_day }
      it 'includes the charity' do
        expect(subject).to eq charity
      end

      it 'returns a single record' do
        expect(subject).to be_a_kind_of Charity
      end
    end

    context 'date is outside of range' do
      let(:start_on) { 1.month.from_now.beginning_of_day }
      let(:end_on)   { 2.months.from_now.beginning_of_day }
      it 'excludes the charity' do
        expect(subject).not_to eq charity
      end

      it 'returns nil' do
        expect(subject).to be_nil
      end
    end
  end

end
