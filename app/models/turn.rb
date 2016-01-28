class Turn < ActiveRecord::Base

  belongs_to :player
  belongs_to :game
  has_many :cards

  before_create :pick_a_card
  after_create :current_player

  # protected

  def 


  def pick_a_card
   if @current_card 
    @current_card.destroy

    @current_card = cards.order("RANDOM()").first
  end
  end

  def current_player
    game.current_player += 1
  end


end