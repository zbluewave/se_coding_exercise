require 'test_helper'
require File.expand_path('../../../../app/packages/nyc_data_loader/incident_facotry', __FILE__)

class IncidentFactoryTest < ActiveSupport::TestCase
    test "parse zip" do
    	factory = get_factory
    	assert_equal("11234", factory.get_zip({"incident_zip": "11234", "school_zip": "11235"}.stringify_keys))
    	assert_equal("11235", factory.get_zip({"school_zip": "11235"}.stringify_keys))

    	assert_nil(factory.get_zip({"zip": "12345"}.stringify_keys))
    end

    test "parse street" do
    	factory = get_factory

    	assert_equal("street", factory.get_street({"street_name": "street"}.stringify_keys))
    	assert_equal("96th street", factory.get_street({"incident_address": "96th street"}.stringify_keys))
    	assert_equal("96th street", factory.get_street({"incident_address": "1250 96th street"}.stringify_keys))
    	assert_equal(
    		"1st street and 2nd street",
    		factory.get_street({"intersection_street_1": "1st street", "intersection_street_2": "2nd street"}.stringify_keys)
    	)

    	assert_nil(factory.get_street({"no_street": "12345"}.stringify_keys))
    end

    test "generate incident class" do
    	factory = get_factory
    	assert_nil factory.get_from_record({})
    	assert_not_nil factory.get_from_record({
    		"street_name": "street",
    		"incident_zip": "11234",
    		"complaint_type": "complaint_type",
    		"status": "status"
    	}.stringify_keys)
    end

    def get_factory
    	NycDataLoader::IncidentFactory.new
    end
end
