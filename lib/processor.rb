# frozen_string_literal: true

# Processor runs an analyzer on the log file entries
class Processor
  def initialize(entry_builder:, analyzer:)
    @entry_builder = entry_builder
    @analyzer = analyzer
  end

  def run(file_paths)
    entries = file_paths.map do |file_path|
      entries_from_file(file_path)
    end.flatten
    analyzer.run entries
  end

  private

  def entries_from_file(file_path)
    File.readlines(file_path).map {|line| entry_builder.build(line) }
  end

  attr_reader :entry_builder, :analyzer
end
