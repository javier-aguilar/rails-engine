module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(search_params)
      results = self.where(nil)
      search_params.each do |key, value|
        results = results.public_send("filter_by_#{key}", value) if value
      end
      results
    end
  end
end
