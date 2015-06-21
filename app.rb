#!/usr/local/bin/ruby

require 'bundler'
Bundler.require

conn = PGconn.connect(
  host: 'localhost',
  user: 'maxmellon',
  dbname: 'maxmellon'
)

helpers do
  def link_to(url, txt = url)
    "<a href='#{url}'>#{txt}</a>"
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

get '/stocks/new/?' do
  slim :'stocks/new'
end

post '/stocks/create/?' do
  pid = params[:pid]
  loc = params[:loc]
  num = params[:num]
  query = "INSERT INTO stock VALUES(#{pid}, '#{loc}', #{num})"
  begin
    @res = conn.exec(query)
  rescue => @res
    puts '登録に失敗しました'
  else
    redirect '/cgi-bin/DBE/index.cgi/stocks/show'
  end
end

get '/products/show/?' do
  query = 'SELECT * FROM products'
  @res = conn.exec(query)
  slim :'products/show'
end

get '/products/new/?' do
  slim :'products/new'
end

post '/products/create/?' do
  pid   = params[:pid]
  name  = params[:name]
  cost  = params[:cost]
  price = params[:price]
  query = "INSERT INTO products VALUES(#{pid}, '#{name}', #{cost}, #{price})"
  begin
    @res = conn.exec(query)
  rescue => @res
    puts '登録に失敗しました'
  else
    redirect '/cgi-bin/DBE/index.cgi/products/show'
  end
end
