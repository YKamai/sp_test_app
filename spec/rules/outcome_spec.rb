# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Rules::Outcome do
  let(:header) { 'outcome header' }
  let(:data) { [['page1', 5], ['page2', 3]] }
  let(:template) { '%s %d visits' }
  subject do
    described_class.new header: header, data: data, print_template: template
  end

  describe 'an instance' do
    it 'has attribute :header' do
      expect(subject.header).to eq "#{header}:"
    end

    it 'has attribute :data' do
      expect(subject.data).to eq data
    end

    it 'has attribute :print_template' do
      expect(subject.print_template).to eq template
    end
  end

  describe '#to_print' do
    it 'returns list of strings' do
      expect(subject.to_print).to eq [
        "#{header}:",
        'page1 5 visits',
        'page2 3 visits'
      ]
    end
  end
end
