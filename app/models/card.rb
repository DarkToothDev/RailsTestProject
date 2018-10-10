class Card < ApplicationRecord
  belongs_to :artist
  has_many :subtypes
  has_many :types

  validates :name, presence: true
  validates :cmc, numericality: { only_integer: true }
  validates :colors, presence: true
  validates :rarity, presence: true
  validates :number, numericality: { only_integer: true }
end
