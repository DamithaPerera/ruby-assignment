class Course < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  Elasticsearch::Model.client = Elasticsearch::Client.new(host: Rails.configuration.elasticsearch[:host])

  belongs_to :category
  validates :name, :author, presence: true

  settings do
    mappings dynamic: 'false' do
      indexes :name, type: :text, analyzer: 'standard', search_analyzer: 'standard'
      indexes :author, type: :text, analyzer: 'standard', search_analyzer: 'standard'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          bool: {
            should: [
              { match: { name: { query: query, fuzziness: 'AUTO' } } },
              { wildcard: { name: "*#{query}*" } }
            ]
          }
        }
      }
    )
  end
end
