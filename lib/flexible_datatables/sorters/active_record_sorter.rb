module FlexibleDatatables
  module ActiveRecordSorter
    def self.sort(opts = {})
      columns = opts.fetch(:columns)
      records = opts.fetch(:records, [])
      order_opts = opts.fetch(:order)
      sort_col = columns[order_opts['0'].fetch(:column).to_i]
      sort_dir = order_opts['0'].fetch(:dir) == 'desc' ? 'desc' : 'asc'
      records.order("#{sort_col} #{sort_dir}")
    end
  end
end
