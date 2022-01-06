# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe EntryBuilders::VisitBuilder do
  subject { described_class.build '' }

  it 'builds an instance of Entries::Visit' do
    expect(subject).to be_instance_of Entries::Visit
  end
end
