#!/usr/local/bin/ruby

load 'app.rb'

set :run, false
set :public_folder, File.dirname(__FILE__) + '/assets'

Rack::Handler::CGI.run Sinatra::Application
