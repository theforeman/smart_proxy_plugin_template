require 'test_helper'
require 'smart_proxy_plugin_template/api'

# Test that the plugin loads and the Smart Proxy reports the correct feature
class PluginTemplateApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::PluginTemplate::Api.new
  end

  def test_root
    get '/'
    assert last_response.ok?, "Last response was not ok: #{last_response.body}"
    assert last_response['Content-Type'] == 'application/json'
    response = JSON.parse(last_response.body)
    assert_equal(response, 'Hello World!')
  end
end
