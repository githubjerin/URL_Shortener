require "json"

require "./modules/urlHandler.module.rb"

url_handler = UrlHandler.new

post '/' do
    request.body.rewind
    url = JSON.parse(request.body.read)['url']

    content_type :json
    { url: url_handler.get_shortend_url(url) }.to_json
end