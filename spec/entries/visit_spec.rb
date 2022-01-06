# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Entries::Visit do
  let(:page) { '/home' }
  let(:ip) { '127.0.0.1' }
  subject { Entries::Visit.new page, ip }

  describe 'an instance' do
    it 'has attribute :page' do
      expect(subject.page).to eq page
    end

    it 'has attribute :ip_address' do
      expect(subject.ip_address).to eq ip
    end
  end
end
