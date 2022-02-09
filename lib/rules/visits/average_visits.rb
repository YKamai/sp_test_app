# frozen_string_literal: true

module Rules
  module Visits
    # MostUniqueVisited is an analyzer rule that provides the list of unique
    # visits sorted by visits number descently
    class AverageVisits < Rules::BaseRule
      def self.apply_on(visits_list)
        visits_per_page = visits_list.group_by(&:page)
        pages_num = visits_per_page.keys.length
        visits_num = visits_per_page.values.sum(&:length)
        average_visits = visits_num / pages_num

        Rules::Outcome.new(
          header: 'Average number of page visits',
          data: [average_visits],
          print_template: '%d visits'
        )
      end
    end
  end
end
