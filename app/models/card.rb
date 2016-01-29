class Card < ActiveRecord::Base

  belongs_to :turn
  belongs_to :game
  has_one :player



end