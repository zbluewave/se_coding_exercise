require 'test_helper'
class ApiIncidentsControllerTest < ActionController::TestCase
	fixtures :incidents
    test "get distinct complaints types" do
        response = JSON.parse(get(:get_complaints_types).body)
        assert_equal 2, response.length
    end

    test "get distinct statuses" do
        response = JSON.parse(get(:get_statuses).body)
        assert_equal 2, response.length
    end

    test "search incidents" do
    	assert_equal 0, JSON.parse(get(:search).body).length

    	assert_equal 3, JSON.parse(get(:search, :street => "street").body).length

    	assert_equal 2, JSON.parse(get(:search, :street => "street", :status=> "status_2").body).length
    end
end