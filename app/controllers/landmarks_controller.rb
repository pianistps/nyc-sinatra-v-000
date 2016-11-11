class LandmarksController < ApplicationController
  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    @landmark = Landmark.create(params[:landmark])

    redirect '/landmarks'
  end

  get '/landmarks' do

    erb :'/landmarks/show'
  end

end
