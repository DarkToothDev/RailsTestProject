class Subtype < ApplicationRecord
  has_many :cardsubtypes
  has_many :cards, through: :cardsubtypes

  validates :name, presence: true
  validates :name, uniqueness: true
end
