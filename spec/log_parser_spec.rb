# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe LogParser do
  let(:file_path) { File.join Dir.pwd, 'spec', 'support', 'data', 'valid.log' }
  let(:visits_processor) do
    visits_analyzer = Analyzer.new [Rules::Visits::MostVisited, Rules::Visits::MostUniqueVisited]
    Processor.new entry_builder: EntryBuilders::VisitBuilder, analyzer: visits_analyzer
  end
  subject do
    described_class.new(
      file_path: file_path,
      processor: visits_processor,
      file_validator: Validators::FileValidator,
      printer: Printer.new
    )
  end

  describe '#run' do
    let(:valid_output) do
      "Ordered list of webpages with most page views:\n"\
        "/help_page/1 3 visits\n"\
        "/contact 1 visits\n"\
        "/home 1 visits\n"\
        "/about/2 1 visits\n"\
        "/index 1 visits\n\n"\
        "Ordered list of webpages with most unique page views:\n"\
        "/help_page/1 3 unique views\n"\
        "/contact 1 unique views\n"\
        "/home 1 unique views\n"\
        "/about/2 1 unique views\n"\
        "/index 1 unique views\n\n"\
    end

    it 'output the result' do
      expect { subject.run }.to output(valid_output).to_stdout
    end
  end
end
