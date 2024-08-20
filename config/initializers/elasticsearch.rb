Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: 'http://localhost:9200',
  transport_options: {
    ssl: {
      verify: false # Disable SSL verification
    }
  }
)
