#!/usr/local/bin/ruby

require 'bundler'
Bundler.require

conn = PGconn.connect(
  host: 'localhost',
  user: 'maxmellon',
  dbname: 'maxmellon'
)

helpers do
  def link_to(url, txt=url)
    %Q(<a href="#{url}">#{txt}</a>)
  end
end

get '/?' do
  slim :index
end

get '/stocks/show/?' do
  query = 'SELECT * FROM stock'
  @res = conn.exec(query)
  slim :'stocks/show'
end

get '/products/show/?' do
  query = 'SELECT * FROM products'
  @res = conn.exec(query)
  slim :'products/show'
end
