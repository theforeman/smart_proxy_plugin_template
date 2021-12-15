require 'plugin_template/api'

map "/plugin_template" do
  run Proxy::PluginTemplate::Api
end
