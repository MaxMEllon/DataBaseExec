#!/usr/local/bin/ruby

load 'app.rb'

set :run, false

Rack::Handler::CGI.run Sinatra::Application
