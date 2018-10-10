class Cardtype < ApplicationRecord
  has_many :cards
  has_many :types

  validates :name, presence: true
  validates :name, uniqueness: true
end
