module FlexibleDatatables
  module KaminariPaginator
    def self.paginate(args = Hash.new)
      per_page = args.fetch(:length, 0).to_i
      per_page = Configurator.settings.items_per_page unless per_page > 0
      page     = args.fetch(:start, 0).to_i / per_page + 1

      records  = args.fetch(:records, [])
      records.page(page).per(per_page)
    end
  end
end
