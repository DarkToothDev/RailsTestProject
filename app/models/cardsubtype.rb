class Cardsubtype < ApplicationRecord
  has_many :cards
  has_many :subtypes

  validates :name, presence: true
end
