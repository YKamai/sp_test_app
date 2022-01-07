# frozen_string_literal: true

# LogParser consumes a log file as an input, handles it and outputs the result
# according to the provided analyzer
class LogParser
  def initialize(file_path:, file_validator:, processor:, printer:)
    @file_path = file_path
    @file_validator = file_validator
    @processor = processor
    @printer = printer
  end

  def run
    validate_log_file
    results = process_log_file
    output results
  end

  private

  attr_reader :file_path, :file_validator, :processor, :printer

  def validate_log_file
    file_validator.validate file_path: file_path, file_format: '.log'
  end

  def process_log_file
    processor.run file_path
  end

  def output(outcome_list)
    outcome_list.each { |rule_outcome| printer.print rule_outcome.to_print }
  end
end
