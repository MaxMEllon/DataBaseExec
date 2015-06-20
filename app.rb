#!/usr/local/bin/ruby

require 'bundler'
Bundler.require

get '/?' do
  slim :index
end

get '/test' do
  'Hello Sakura World!!'
end
