# Homepage (Root path)
require 'sinatra'
helpers do 
  def current_game 
    Game.find { |u| u[:id] == session[:game_id] } if session[:game_id]
  end
end
# Homepage (Root path)
get '/' do
  erb :index
end
post '/game' do
  @game = Game.new 
  count = params[:num_of_players].to_i
  if @game.save 
    for i in 1..count  
      @game.players.create
    end
    session[:game_id] = @game.id 
    redirect '/'
  else
    erb :'sign_up'
  end 
end

post '/game/players' do
  param_keys=params.keys
  player_details = Hash.new
  param_keys.each do |key|
    player_details[key] = params[key]
  end
  # game_id = session[:game_id]
  current_game.players.each do |player|
    player_details.each do |id, name|
      if player.id.to_i == id.to_i
        player.name = name
        player.save 
      end
    end
  end
  @turn = Turn.new 
  @turn.game_id = current_game.id
  @turn.player_id = player_details.keys[0]
  current_game.current_player = @turn.player_id 
  # @turn.pick_a_card
  if current_game.save 
    if @turn.save 
      @players = Player.all 
      erb :game
    end 
  end
end 
# get '/game' do 
#   puts game.turns.where(player_id: current_game.current_player)
#   erb :game 
# end 

get '/turn' do
  @game = current_game
  @turn = @game.turns.last
  @players = @game.players
  @current_player = @game.current_player
  erb :game
end

post '/turn' do
  # game_id = session[:game_id]
  # game = Game.find(game_id)
  @turn = Turn.new
  @turn.game_id = current_game.id 
  @turn.set_current_player 
  # @turn.increment_player_id
  @turn.pick_a_card
  if @turn.save
    @players = current_game.players.all  
    erb :game
  end
end 