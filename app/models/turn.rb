class Turn < ActiveRecord::Base

  belongs_to :player
  belongs_to :game
  has_one :card

  # validates :game_id, presence: true
  # validates :card_id, presence: true
  # before_create :pick_a_card
  # after_create :set_current_player



  # protected

  def pick_a_card
     self.card = Card.where("used_at = ?", false ).order("RANDOM()").first
     if self.card == nil
      puts "Game is over"
     else
      self.card_id = self.card.id
      self.save!
       self.card.used_at = true
       self.card.save!
      return self.card
     end
  end

  def set_current_player
    if game.current_player < game.players.length
      game.current_player += 1
      game.save!
      # self.player_id = game.current_player
      # self.save!
    else
      game.current_player = 1
      game.save!
      # self.player_id = 1
      # self.save!
    end
  end

  # def increment_player_id
  #   self.player_id = game.current_player
  # end

end