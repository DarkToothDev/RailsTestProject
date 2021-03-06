class Artist < ApplicationRecord
  has_many :cards

  validates :name, presence: true
  validates :name, uniqueness: true
end
