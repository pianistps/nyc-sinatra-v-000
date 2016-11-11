class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params["landmark"][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures/#{figure.id}"
  end
end
