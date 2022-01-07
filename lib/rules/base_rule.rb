# frozen_string_literal: true

module Rules
  # BaseRule is an abstract base class for all analyzer rules
  class BaseRule
    def self.apply_on(_)
      raise NotImplementedError,
            "#{name} has not implemented method '#{__method__}'"
    end
  end
end
