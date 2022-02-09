# frozen_string_literal: true

module Rules
  module Visits
    # MostUniqueVisited is an analyzer rule that provides the list of unique
    # visits sorted by visits number descently
    class MostUniqueVisited < Rules::BaseRule
      def self.apply_on(visits_list)
        visits_per_page = visits_list.group_by(&:page)
        unique_visits = visits_per_page.map do |page, page_visits|
          [page, page_visits.map(&:ip_address).uniq.length]
        end
        Rules::Outcome.new(
          header: I18n.t('rules.most_unique_visited.header'),
          data: unique_visits.sort_by { |_, number| -number },
          print_template: I18n.t('rules.most_unique_visited.template')
        )
      end
    end
  end
end
