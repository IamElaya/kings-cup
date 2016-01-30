# Homepage (Root path)
require 'sinatra'
​
helpers do 
  def current_game 
    @game ||= Game.find(session[:game_id]) if session[:game_id]
  end
end
​
​
# Homepage (Root path)
get '/' do
  erb :index
end
​
​
post '/game' do
  @game = Game.new 
  count = params[:num_of_players].to_i
​
  if @game.save 
    for i in 1..count  
      @game.players.create
    end
    session[:game_id] = @game.id 
    redirect '/'
  else
    redirect '/'
  end 
end
​
  # if game.save 
  #   session[:game_id] = game.id 
  #   redirect '/'
  # else
  #   erb :index
  # end
​
post '/game/players' do
​
  #Get all the Param Keys
  param_keys=params.keys
  #Get create an empty hash for storing player id and player names
  player_details = Hash.new
​
  #use a loop for storing players details with id and name in a hash
  param_keys.each do |key|
    player_details[key] = params[key]
  end
​
  #We get the current Game 
  game_id = session[:game_id]
  game = Game.find(game_id)
 
  #We use a loop for all the players for that Game id
  #We use the internal loop to go through the hash.
  # if the hash id is equivalent to the player id then we update the player name
  game.players.each do |player|
    player_details.each do |id, name|
      if player.id.to_i == id.to_i
        player.name = name
        player.save 
      end
    end
  end
  @turn = Turn.new 
  @turn.game_id = game_id
  @turn.player_id = player_details.keys[0]
  game.current_player = @turn.player_id 
  @turn.pick_a_card
  if game.save 
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
​
post '/turn' do
  game_id = session[:game_id]
  game = Game.find(game_id)
  @turn = Turn.new
  @turn.game_id = game.id 
  @turn.set_current_player 
  @turn.increment_player_id
  @turn.pick_a_card
  if @turn.save
    @players = game.players.all  
    erb :game
  end
end 
​
