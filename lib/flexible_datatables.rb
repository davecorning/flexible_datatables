require 'ostruct'
require 'flexible_datatables/paginators'
require 'flexible_datatables/configurator'
require 'flexible_datatables/datatable'

module FlexibleDatatables
  def self.configuration
    Configurator.configuration do |config|
      yield(config)
    end
  end

  def self.settings
    Configurator.settings
  end
end
