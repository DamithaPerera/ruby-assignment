namespace :elasticsearch do
  desc "Create Elasticsearch indices and import data"
  task import_data: :environment do
    models = [Vertical, Category, Course]

    models.each do |model|
      puts "Creating index for #{model.name}..."
      model.__elasticsearch__.create_index!(force: true)
      puts "Importing data for #{model.name}..."
      model.import(force: true)
    end

    puts "Elasticsearch indices created and data imported successfully."
  end
end
