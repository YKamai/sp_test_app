# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Rules::Visits::MostUniqueVisited do
  let(:visits_list) do
    [
      %w[page2 0.0.0.0],
      %w[page2 0.0.0.0],
      %w[page2 0.0.0.0],
      %w[page1 0.0.0.0],
      %w[page1 0.0.0.1],
      %w[page1 0.0.0.1],
      %w[page1 0.0.0.2],
      %w[page1 0.0.0.2]
    ].map { |page, ip_address| Entries::Visit.new page, ip_address }
  end

  describe '#apply_on' do
    context 'returns the instance of Rules::Outcome' do
      subject { described_class.apply_on visits_list }

      it 'with valid header' do
        expect(subject.header).to eq(
          'Ordered list of webpages with most unique page views:'
        )
      end

      it 'with valid print_template' do
        expect(subject.print_template).to eq '%s %d unique views'
      end

      it 'with sorted data' do
        expect(subject.data).to eq [['page1', 3], ['page2', 1]]
      end
    end
  end
end
