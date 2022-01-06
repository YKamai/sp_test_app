# frozen_string_literal: true

# Print the incoming list to the provided output which is current default output by default.
class Printer
  def initialize(output: $stdout)
    @output = output
  end

  def print(lines)
    lines.each { |line| print_line line }
    print_line "\n"
  end

  def print_line(line)
    output.puts line
  end

  private

  attr_reader :output
end
