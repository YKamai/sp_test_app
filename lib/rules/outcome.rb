# frozen_string_literal: true

module Rules
  # Outcome represents a result of applying a rule
  class Outcome
    attr_reader :header, :data, :print_template

    def initialize(header:, data:, print_template:)
      @header = "#{header}:"
      @data = data
      @print_template = print_template
    end

    def to_print
      [
        header,
        data.map { |entity| print_template % entity }
      ].flatten
    end
  end
end
