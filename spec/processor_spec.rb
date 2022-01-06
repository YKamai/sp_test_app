# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Processor do
  let(:entry_builder) { class_double('EntryBuilders::VisitBuilder') }
  let(:analyzer) { instance_double('Analyzer') }
  subject do
    Processor.new entry_builder: entry_builder, analyzer: analyzer
  end

  describe '#run' do
    let(:file_path) { File.join Dir.pwd, 'spec', 'support', 'data', '2_entries.log' }

    it 'calls entry_builder for each file line and runs analyser once' do
      expect(analyzer).to receive(:run).once
      expect(entry_builder).to receive(:build).twice
      subject.run(file_path)
    end
  end
end
