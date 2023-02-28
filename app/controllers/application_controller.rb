class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    Game.all.to_json
  end

  get '/games/:id' do
    Game.find(params[:id]).to_json(only: [:title, :genre, :platform, :price], include: {
      reviews: { only: [:score, :comment], include: { user: { only:[:name] }}}
      })
  end
end
