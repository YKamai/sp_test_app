# frozen_string_literal: true

module EntryBuilders
  # Builder is an abstract base class for all entry builders
  class Builder
    def self.build(_)
      raise NotImplementedError,
            "#{name} has not implemented method '#{__method__}'"
    end
  end
end
