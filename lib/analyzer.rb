# frozen_string_literal: true

# Analyzer applies the list of analyzis rules on the provided set of data
class Analyzer
  def initialize(rules = [])
    @rules = rules
  end

  def run(data)
    rules.map { |rule| rule.apply_on(data) }
  end

  private

  attr_reader :rules
end
