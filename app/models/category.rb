class Category < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  Elasticsearch::Model.client = Elasticsearch::Client.new(host: Rails.configuration.elasticsearch[:host])
  
  belongs_to :vertical
  has_many :courses, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :vertical_id, case_sensitive: false }

  settings do
    mappings dynamic: 'false' do
      indexes :name, type: :text, analyzer: 'standard', search_analyzer: 'standard'
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
