# frozen_string_literal: true

require_relative 'lib/analyzer'
require_relative 'lib/log_parser'
require_relative 'lib/printer'
require_relative 'lib/processor'
require_relative 'lib/entries/visit'
require_relative 'lib/entry_builders/builder'
require_relative 'lib/entry_builders/visit_builder'
require_relative 'lib/rules/base_rule'
require_relative 'lib/rules/outcome'
require_relative 'lib/rules/visits/most_unique_visited'
require_relative 'lib/rules/visits/most_visited'
require_relative 'lib/validators/file_validator'

file_path = ARGV.first
visits_analyzer = Analyzer.new [Rules::Visits::MostVisited, Rules::Visits::MostUniqueVisited]
visits_processor = Processor.new entry_builder: EntryBuilders::VisitBuilder, analyzer: visits_analyzer
LogParser.new(
  file_path: file_path,
  file_validator: Validators::FileValidator,
  processor: visits_processor,
  printer: Printer.new
).run
