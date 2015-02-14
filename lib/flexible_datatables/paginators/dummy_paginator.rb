module FlexibleDatatables
  module DummyPaginator
    def self.paginate(args = Hash.new)
      args.fetch(:records, [])
    end
  end
end
