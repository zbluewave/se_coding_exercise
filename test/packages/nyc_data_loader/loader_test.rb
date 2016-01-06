require 'test_helper'
require File.expand_path('../../../../app/packages/nyc_data_loader/loader', __FILE__)

class LoaderTest < ActiveSupport::TestCase
    test "Loader read file and save to db" do
    	loader = NycDataLoader::Loader.new
    	loader.load_from_file(File.expand_path('../', __FILE__) + '/test_data.json')

	    assert Incident.where("zip=?", "11224").length == 1
    end
end

