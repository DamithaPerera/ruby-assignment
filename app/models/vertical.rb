class Vertical < ApplicationRecord
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    Elasticsearch::Model.client = Elasticsearch::Client.new(host: Rails.configuration.elasticsearch[:host])

    has_many :categories, dependent: :destroy
    validates :name, presence: true, uniqueness: { case_sensitive: false }
  end