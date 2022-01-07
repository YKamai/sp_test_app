# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Analyzer do
  describe '#run' do
    let(:rule1) { class_double('Rules::Visits::MostUniqueVisited') }
    let(:rule2) { class_double('Rules::Visits::MostVisited') }

    subject { described_class.new [rule1, rule2] }

    it 'applies all the rules' do
      expect(rule1).to receive(:apply_on).once
      expect(rule2).to receive(:apply_on).once
      subject.run []
    end
  end
end
