class SearchResult
  include ActiveModel::Model
  attr_reader :simple_search, :search_title, :fuzzy_search, :id_search

  def initialize(options={})
    @page = options[:page]
    @simple_search = options[:simple_search]
    @search_title = options[:search_title]
    @fuzzy_search = options[:fuzzy_search]
    @id_search = options[:id_search]
  end

  def organisations
    search_scope(Organisation)
  end

  def page_size
    10
  end

  def to_hash
    paginated_organisations = organisations.page(@page).per(page_size)

    {
      organisations: paginated_organisations.records.to_a.map{ |org| org.as_json },
      page: @page,
      total_pages: paginated_organisations.total_pages,
      total_count: paginated_organisations.total_count,
      page_size: page_size
    }
  end

  protected
  def search_scope(starting_scope)
    base_scope = starting_scope.dup
    hash = {query: {}}
    query = hash[:query]

    if @simple_search.present?
      query.merge!({
        match:{
          _all: @simple_search
        }
      })
    end

    if @search_title.present?
      query.merge!({
        match:{
          title: @search_title
        }
      })
    end

    if @fuzzy_search.present?
      query.merge!({
        fuzzy: {
          account_description: @fuzzy_search
        }
      })
    end

    if @id_search.present?
      query.merge!({
        ids: {
          type: 'organisation',
          values: @id_search.split(',')
        }
      })
    end

    base_scope.search hash
  end

end
