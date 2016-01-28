class Turn < ActiveRecord::Base

  belongs_to :player
  belongs_to :game
  has_many :cards


end