class Cardsubtype < ApplicationRecord
  has_many :cards
  has_many :subtypes

  validates :name, presence: true
  validates :name, uniqueness: true
end
