#!/usr/local/bin/ruby

require 'bundler'
Bundler.require

conn = PGconn.connect(
  host: 'localhost',
  user: 'maxmellon',
  dbname: 'maxmellon'
)

set :public_folder, File.dirname(__FILE__) + '/assets'

helpers do
  def link_to(url, txt = url)
    "<a href=\"#{url}\">#{txt}</a>"
  end
end

get '/?' do
  slim :index
end

get '/stock/show/?' do
  query = 'SELECT * FROM stock'
  @res = conn.exec(query)
  slim :'stocks/show'
end

get '/product/show/?' do
  query = 'SELECT * FROM products'
  @res = conn.exec(query)
  slim :'products/show'
end
