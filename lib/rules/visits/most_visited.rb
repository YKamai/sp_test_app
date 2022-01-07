# frozen_string_literal: true

module Rules
  module Visits
    # MostVisited is an analyzer rule that provides the list of visits
    # sorted by visits number descently
    class MostVisited < Rules::BaseRule
      def self.apply_on(visits_list)
        pages = visits_list.map(&:page).reject(&:empty?)
        sorted_result = pages.tally.sort_by { |_, number| -number }
        Rules::Outcome.new(
          header: 'Ordered list of webpages with most page views',
          data: sorted_result,
          print_template: '%s %d visits'
        )
      end
    end
  end
end
