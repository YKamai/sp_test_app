# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Printer do
  let(:string_output) { StringIO.new }
  subject { Printer.new(output: string_output) }

  describe '#print_line' do
    let(:line) { 'a line to print' }

    before { subject.print_line line }

    it 'prints a line' do
      expect(string_output.string).to eq "#{line}\n"
    end
  end

  describe '#print' do
    let(:line1) { 'a line to print #1' }
    let(:line2) { 'a line to print #2' }

    before { subject.print [line1, line2] }

    it 'prints multiple lines' do
      expect(string_output.string).to eq "#{line1}\n#{line2}\n\n"\
    end
  end
end
