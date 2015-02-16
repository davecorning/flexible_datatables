module FlexibleDatatables
  module Configurator
    class Settings
      attr_accessor :items_per_page, :paginator, :sorter

      def initialize
        @items_per_page = 10
        @paginator = ::FlexibleDatatables::DummyPaginator
        @sorter    = ::FlexibleDatatables::ProxySorter
      end
    end

    @@settings = Settings.new
    def self.configuration
      yield(@@settings)
    end

    def self.settings
      @@settings
    end
  end
end
