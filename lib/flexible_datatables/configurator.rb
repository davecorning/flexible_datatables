module FlexibleDatatables
  module Configurator
    class Settings
      attr_accessor :items_per_page, :paginator

      def initialize
        @items_per_page = 10
        @paginator = DummyPaginator
      end
    end

    def self.configuration
      @@settings ||= Settings.new
      yield(@@settings)
    end

    def self.settings
      @@settings
    end
  end
end
