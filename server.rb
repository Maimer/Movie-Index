require 'sinatra'
require_relative 'helpers'

get '/' do
  redirect '/movies'
end

get '/movies' do
  @title = "Movie Index"
  @data = build_data().sort_by { |moviehash| moviehash["title"] }
  erb :'movies/index'
end

get '/movies/:movie_id' do
  @id = params[:movie_id]
  @data = build_data()
  @title = find_id(@data, @id)
  @movie = find_movie(@data, @id)
  erb :'movies/moviepage'
end
