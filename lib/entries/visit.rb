# frozen_string_literal: true

module Entries
  # Represents a page visit/view as an object.
  class Visit
    attr_reader :page, :ip_address

    def initialize(page, ip)
      @page = page
      @ip_address = ip
    end
  end
end
