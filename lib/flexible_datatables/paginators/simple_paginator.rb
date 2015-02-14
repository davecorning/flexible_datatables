module FlexibleDatatables
  module SimplePaginator
    def self.paginate(args = Hash.new)
      per_page = args.fetch(:length, 0).to_i
      per_page = Configurator.settings.items_per_page unless per_page > 0
      start    = args.fetch(:start, 0).to_i

      records  = args.fetch(:records, [])
      records.slice(start, per_page)
    end
  end
end
