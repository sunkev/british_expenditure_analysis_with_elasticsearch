require 'elasticsearch/model'
require 'jbuilder'

class Organisation < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 50, number_of_replicas: 10 } do
    # mappings dynamic: 'false' do
    #   indexes :title, analyzer: 'english', index_options: 'offsets'
    # end
  end
end