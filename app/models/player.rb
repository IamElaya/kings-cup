class Player < ActiveRecord::Base

  belongs_to :game
  has_many :turns
  has_many :cards
  # validates :game_id, presence: true  

end