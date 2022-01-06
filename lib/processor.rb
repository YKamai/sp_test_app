# frozen_string_literal: true

# Processor runs an analyzer on the log file entries
class Processor
  def initialize(entry_builder:, analyzer:)
    @entry_builder = entry_builder
    @analyzer = analyzer
  end

  def run(file_path)
    entries = File.readlines(file_path).map do |line|
      entry_builder.build(line)
    end
    analyzer.run entries
  end

  private

  attr_reader :entry_builder, :analyzer
end
