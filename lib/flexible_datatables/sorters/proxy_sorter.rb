module FlexibleDatatables
  module ProxySorter
    def self.sort(opts = {})
      columns    = opts.fetch(:columns)
      records    = opts.fetch(:records, [])
      order_opts = opts.fetch(:order)
      sorted_records = []
      begin
        sorted_records =
          ActiveRecordSorter.sort(records: records, columns: columns, order: order_opts)
      rescue NoMethodError
        sorted_records =
          EnumerableSorter.sort(records: records, order: order_opts)
      end
      sorted_records
    end
  end
end
