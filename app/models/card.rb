class Card < ApplicationRecord
  belongs_to :artist
  has_many :cardsubtypes
  has_many :subtypes, through: :cardsubtypes
  has_many :cardtypes
  has_many :types, through: :cardtypes

  validates :name, presence: true
  validates :cmc, numericality: { only_integer: true }
  validates :colors, presence: true
end
