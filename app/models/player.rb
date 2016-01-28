class Player < ActiveRecord::Base

  belongs_to :game
  has_many :turns
  

end