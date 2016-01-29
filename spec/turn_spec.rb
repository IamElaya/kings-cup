describe Turn do 

  describe "#set_current_player" do
    

    it 'should increment current player' do
      @game = Game.create
      @game.players.create
      @game.players.create
      @game.players.create
      @card1 = Card.create
      @turn = @game.turns.create
      expect(@game.current_player).to be(2)
    end 

     it 'should go back to player 1 after all players took a turn' do
      @game = Game.create
      @game.players.create
      @game.players.create
      @game.players.create
      @card1 = Card.create
      @game.current_player = 3
      @turn = @game.turns.create
      expect(@game.current_player).to be(1)
    end

     it 'should increment player id' do
      @game = Game.create
      @game.players.create
      @game.players.create
      @game.players.create
      @card1 = Card.create
      @turn = @game.turns.create
      expect(@turn.player_id).to be(2)
    end
  end

  describe "#pick_a_card" do

    it 'should pick a card' do
      @game = Game.create
      @card1 = Card.create
      @card2 = Card.create
      @card3 = Card.create
      @card4 = Card.create
      @card5 = Card.create
      @card6 = Card.create
      @card7 = Card.create
      @turn = @game.turns.create
      expect(@turn.pick_a_card.used_at).to eql(true)
    end
  end

end