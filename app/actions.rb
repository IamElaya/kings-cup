# Homepage (Root path)
get '/' do
  erb :index
end

get '/game' do
  erb :game
end
