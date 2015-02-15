module FlexibleDatatables
  class Datatable
    attr_accessor :collection, :columns

    def initialize(args = {})
      @columns   = []
      @draw      = args.fetch(:draw).to_i
      @grid      = []
      @length    = args.fetch(:length, Configurator.settings.items_per_page).to_i
      @order     = args.fetch(:order, {})
      @paginator = args.fetch(:paginator, Configurator.settings.paginator)
      @start     = args.fetch(:start, 0).to_i
    end

    def as_json(options = {})
      {
        draw:            draw,
        recordsTotal:    collection.length,
        recordsFiltered: collection.length,
        data:            @grid
      }
    end

    def format_grid(cols = [])
      @columns = cols unless cols.empty?
      records = collection.order("#{sort_column} #{sort_direction}")
      @grid = paginate(records).map { |record| yield(record) }
    end

    private
    attr_reader :draw,
                :length,
                :order,
                :paginator,
                :start

    def sort_column
      @columns[order["0"].fetch(:column).to_i]
    end

    def sort_direction
      order["0"].fetch(:dir) == "desc" ? "desc" : "asc"
    end

    def paginate(records)
      paginator.paginate(start: start, length: length, records: records)
    end
  end
end
