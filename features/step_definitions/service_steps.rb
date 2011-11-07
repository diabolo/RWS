module ServiceHelper
  include Rack::Test::Methods

  def json_headers
    header 'Accept', 'application/json'
    header 'Content-Type', 'application/json'
  end

  def call_create(path=nil, params={})
    path ||= services_path
    json_headers
    post(path, params.to_json)
  end
end
World(ServiceHelper)

When /^I call create on the service$/ do
  call_create
end

Then /^I should receive a response$/ do
  last_response.should_not be_nil
end

