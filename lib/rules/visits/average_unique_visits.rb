# frozen_string_literal: true

module Rules
  module Visits
    # MostUniqueVisited is an analyzer rule that provides the list of unique
    # visits sorted by visits number descently
    class AverageUniqueVisits < Rules::BaseRule
      def self.apply_on(visits_list)
        visits_per_page = visits_list.group_by(&:page)
        unique_visits = visits_per_page.map do |page, page_visits|
          [page, page_visits.map(&:ip_address).uniq.length]
        end

        pages_num = unique_visits.length
        visits_num = unique_visits.sum{|unique_visit|unique_visit[1]}
        average_visits = visits_num / pages_num

        Rules::Outcome.new(
          header: 'Average number of unique page visits',
          data: [average_visits],
          print_template: '%d visits'
        )
      end
    end
  end
end
