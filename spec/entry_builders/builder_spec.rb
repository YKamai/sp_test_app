# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe EntryBuilders::Builder do
  describe '#build' do
    subject { described_class.build('') }

    it 'raise NotImplementedError' do
      expect { subject }.to raise_error NotImplementedError
    end
  end
end
