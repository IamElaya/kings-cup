class Turn < ActiveRecord::Base

  belongs_to :player
  belongs_to :game
  has_many :cards

  before_create :pick_a_card
  after_create :set_current_player



  protected

  def pick_a_card
     @current_card = cards.where("used_at = ?", false ).order("RANDOM()").first
     self.card_id = @current_card.id
     self.save!
     @current_card.used_at = true
     @current_card.save!
  end

  def set_current_player
    if game.current_player < game.players.count
      game.current_player += 1
      game.save!
      self.player_id = game.current_player
      self.save!
    else
      game.current_player = 1
      game.save!
      self.player_id = 1
      self.save!
    end
  end

end