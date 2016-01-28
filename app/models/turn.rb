class Turn < ActiveRecord::Base

  belongs_to :player
  belongs_to :game
  has_many :cards

  before_create :pick_a_card
  after_create :current_player

  # protected

  def 


  def pick_a_card

   @current_card = cards.where("used_at = ?", false ).order("RANDOM()").first
   self.card_id = @current_card.id
   self.save!
   @current_card.used_at = true
   @current_card.save!

   
  end



  def current_player
    game.current_player += 1
  end


end