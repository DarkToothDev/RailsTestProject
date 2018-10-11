class Cardtype < ApplicationRecord
  has_many :cards
  has_many :types

end
