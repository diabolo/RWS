module ServiceHelper
  include Rack::Test::Methods

  def json_headers
    header 'Accept', 'application/json'
    header 'Content-Type', 'application/json'
  end

  def call_create(params=default_service)
    json_headers
    post(services_path, params.to_json)
  end

  def last_response_url
    JSON.parse(last_response.body)['url']
  end

  def default_service
    {
      :requestor => "fred.flinstone@example.com"
    }
  end
end
World(ServiceHelper)

When /^I call create on the service$/ do
  call_create
end

Then /^I should receive a response$/ do
  last_response.should_not be_nil
end

Then /^the reponse should contain the url of the service$/ do
  last_response_url.should_not be_nil
end

When /^I use the response url to receive the service$/ do
  json_headers
  get last_response_url
end

Then /^I should see the service$/ do
  JSON.parse(last_response.body)['service'].should_not be_nil
end

When /^I call create on the service without the requestor$/ do
  call_create(default_service.except(:requestor))
end

Then /^I should receive an error$/ do
  (400..499).should be_member(last_response.status)
end

Then /^I should receive usage instructions$/ do
  JSON.parse(last_response.body)['usage'].should_not be_nil
end

Then /^I should receive a message about the requestor$/ do
  last_response.body.should match(/requestor('|"):/)
end

