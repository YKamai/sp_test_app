# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Rules::BaseRule do
  describe '#apply_on' do
    subject { described_class.apply_on [] }

    it 'raise NotImplementedError' do
      expect { subject }.to raise_error NotImplementedError
    end
  end
end
