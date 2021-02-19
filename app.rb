require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end
=begin
    get '/new' do
      erb :new
    end
=end
    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do

      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |details|
        Ship.new(details)
        #binding.pry
      end

      @ships = Ship.all
      @one = @ships.first
      @two = @ships.last

      erb :'pirates/show'
    end

  end
end