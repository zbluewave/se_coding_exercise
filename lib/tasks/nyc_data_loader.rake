namespace :nyc_data_loader do
  desc "import_datas"
  task :import_data do
    puts "Loading Datas...."
    require File.expand_path('../../../app/packages/nyc_data_loader/loader', __FILE__)
    ::Rails.application.initialize!

    loader = NycDataLoader::Loader.new

    prefix = File.expand_path('../../../db/nyc_data', __FILE__) + '/'

    loader.load_from_file(prefix + 'data1.json')
    loader.load_from_file(prefix + 'data2.json')
    loader.load_from_file(prefix + 'data3.json')
  end
end