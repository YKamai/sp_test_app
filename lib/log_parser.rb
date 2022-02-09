# frozen_string_literal: true

# LogParser consumes a log file as an input, handles it and outputs the result
# according to the provided analyzer
class LogParser
  def initialize(file_paths:, file_validator:, processor:, printer:)
    @file_paths = file_paths
    @file_validator = file_validator
    @processor = processor
    @printer = printer
  end

  def run
    validate_log_files
    results = process_log_files
    output results
  end

  private

  attr_reader :file_paths, :file_validator, :processor, :printer

  def validate_log_files
    file_paths.each { |file_path| validate_log_file(file_path) }
  end

  def validate_log_file(file_path)
    file_validator.validate file_path: file_path, file_format: '.log'
  end

  def process_log_files
    processor.run file_paths
  end

  def output(outcome_list)
    outcome_list.each { |rule_outcome| printer.print rule_outcome.to_print }
  end
end
