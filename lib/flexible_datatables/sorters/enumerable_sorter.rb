module FlexibleDatatables
  module EnumerableSorter
    def self.sort(opts = {})
      order     = opts.fetch(:order)
      sort_dir = order['0'].fetch(:dir) == 'desc' ? 'desc' : 'asc'
      sort_col = order['0'].fetch(:column).to_i
      records   = opts.fetch(:records, [])

      sorted_records = records.sort_by do |row|
        row[sort_col]
      end
      sorted_records.reverse if sort_dir == 'desc'
      sorted_records
    end
  end
end
