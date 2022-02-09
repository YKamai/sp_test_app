# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe LogParser do
  let(:file_path) { File.join Dir.pwd, 'spec', 'support', 'data', 'valid.log' }
  let(:file_paths) do
    [
      File.join(Dir.pwd, 'spec', 'support', 'data', 'valid.log'),
      File.join(Dir.pwd, 'spec', 'support', 'data', 'valid.log')
    ]
  end
  let(:visits_processor) do
    visits_analyzer = Analyzer.new [Rules::Visits::MostVisited, Rules::Visits::MostUniqueVisited]
    Processor.new entry_builder: EntryBuilders::VisitBuilder, analyzer: visits_analyzer
  end

  describe '#run' do
    context 'with one input file' do
      subject do
        described_class.new(
          file_paths: [file_path],
          processor: visits_processor,
          file_validator: Validators::FileValidator,
          printer: Printer.new
        )
      end

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

    context 'with two input files' do
      subject do
        described_class.new(
          file_paths: file_paths,
          processor: visits_processor,
          file_validator: Validators::FileValidator,
          printer: Printer.new
        )
      end
      let(:valid_output) do
        "Ordered list of webpages with most page views:\n"\
          "/help_page/1 6 visits\n"\
          "/contact 2 visits\n"\
          "/home 2 visits\n"\
          "/about/2 2 visits\n"\
          "/index 2 visits\n\n"\
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
end
