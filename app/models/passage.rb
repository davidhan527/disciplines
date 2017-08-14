class Passage < ApplicationRecord
  has_many :cards
  validates :reference, presence: true, uniqueness: true
end
