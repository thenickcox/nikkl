require 'load_rails'
require 'spec_helper'

describe Link do

  describe 'validations' do
    let(:link) { described_class.new }
    it { expect(link).to allow_value('http://google.com').for(:url) }
    it { expect(link).not_to allow_value('puppies').for(:url) }
  end
end
