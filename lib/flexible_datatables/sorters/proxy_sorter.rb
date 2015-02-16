module FlexibleDatatables
  module ProxySorter
    def self.sort(opts = {})
      columns    = opts.fetch(:columns)
      records    = opts.fetch(:records, [])
      order_opts = opts.fetch(:order)
      ActiveRecordSorter.sort(records: records, columns: columns, order: order_opts)
    end
  end
end
