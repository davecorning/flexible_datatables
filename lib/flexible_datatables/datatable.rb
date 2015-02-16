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
      @sorter    = Configurator.settings.sorter
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
      records = sort(records)
      @grid = paginate(records).map { |record| yield(record) }
    end

    private
    attr_reader :draw,
                :length,
                :order,
                :paginator,
                :start,
                :sorter

    def paginate(records)
      paginator.paginate(start: start, length: length, records: records)
    end

    def sort(records)
      sorter.sort(columns: @columns, records: collection, order: order)
    end
  end
end
