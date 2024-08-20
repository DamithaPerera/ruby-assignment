class Category < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  Elasticsearch::Model.client = Elasticsearch::Client.new(host: Rails.configuration.elasticsearch[:host])
  
  belongs_to :vertical
  has_many :courses, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :vertical_id, case_sensitive: false }
end