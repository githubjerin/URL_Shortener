require "sinatra"
require "dotenv"

Dotenv.load
set :port => ENV['PORT']

require "./routes/url.route.rb"
require "./routes/page.route.rb"