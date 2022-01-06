# frozen_string_literal: true

module EntryBuilders
  # Creates new instance of Entries::Visit from log entry
  class VisitBuilder < Builder
    def self.build(entry_string)
      visit_params = entry_string.split
      Entries::Visit.new visit_params[0], visit_params[1]
    end
  end
end
