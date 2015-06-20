#!/usr/local/bin/ruby

require 'bundler'
Bundler.require

get '/?' do
  slim :index
end

