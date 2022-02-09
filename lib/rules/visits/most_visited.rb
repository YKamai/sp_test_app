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
          header: I18n.t('rules.most_visited.header'),
          data: sorted_result,
          print_template: I18n.t('rules.most_visited.template')
        )
      end
    end
  end
end
