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

get '/*/?' do |path|
  query = "SELECT * FROM #{path}"
  @res = conn.exec(query)
  slim :"#{path}/show"
end

get '/*/new/?' do |path|
  slim :"#{path}/new"
end

get '/error' do
  slim :error
end

post '/*/delete/?' do |path|
  pid = params[:id]
  query = "DELETE FROM #{path} WHERE pid=#{pid}"
  begin
    @res = conn.exec(query)
  rescue => @res
    @error_message = @res
    reqirect '/cgi-bin/DBE/index.cgi/error'
  end
end

post '/*/create/?' do |path|
  values = get_values(path)
  query = "INSERT INTO #{path} #{values}"
  begin
    @res = conn.exec(query)
  rescue => @res
    @error_message = @res
    reqirect '/cgi-bin/DBE/index.cgi/error'
  else
    redirect "/cgi-bin/DBE/index.cgi/#{path}"
  end
end

def get_values(path)
  pid = params[:pid]
  if path == 'stocks'
    loc = params[:loc]
    num = params[:num]
    values = "VALUES(#{pid}, '#{loc}', #{num})"
  elsif path == 'products'
    name = params[:name]
    cost = params[:cost]
    price = params[:price]
    values = "VALUES(#{pid}, '#{name}', #{cost}, #{price})"
  else
    values = ''
  end
  values
end
