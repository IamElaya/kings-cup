describe Turn do 

  describe "#set_current_player" do
    

    it 'should increment current player' do
      @game = Game.create
      @game.players.create
      @game.players.create
      @game.players.create
      @card1 = Card.create
      @turn = @game.turns.create
      @turn.set_current_player
      expect(@game.current_player).to be(1)
    end 

     it 'should go back to player 1 after all players took a turn' do
      @game = Game.create
      @game.players.create
      @game.players.create
      @game.players.create
      @card1 = Card.create
      @game.current_player = 3
      @turn = @game.turns.create
      @turn.set_current_player
      @turn.increment_player_id
      expect(@game.current_player).to be(1)
    end

     it 'should increment player id' do
      @game = Game.create
      @game.players.create
      @game.players.create
      @game.players.create
      @card1 = Card.create
      @turn = @game.turns.create
      @turn.set_current_player
      @turn.increment_player_id
      expect(@turn.player_id).to be(1)
    end
  end

  describe "#pick_a_card" do

    it 'should pick a card' do
      @game = Game.create
      @turn = @game.turns.create
      @turn.pick_a_card
      expect(@turn.card.used_at).to eql(true)
    end

    #  it 'should not be able to pick a card if there is none left' do
    #   @game = Game.create
    #   @card1 = Card.create
    #   @card2 = Card.create
    #   @card1.used_at = true
    #   @card2.used_at = true
    #   @card1.save
    #   @card2.save
    #   @turn = @game.turns.create
    #   expect(@turn.pick_a_card).to eql(nil)
    # end
  end

end