class Card < ApplicationRecord
  belongs_to :artist
  has_many :subtypes
  has_many :types

  validates :name, presence: true
end
