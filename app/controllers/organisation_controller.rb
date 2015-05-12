class OrganisationController < ApplicationController
  respond_to :html, :json

  def index
    @organisations = Organisation.all

    respond_with @organisations
  end

  def search
    search_result = SearchResult.new(params)

    render json: search_result.to_hash.to_json
  end
end
