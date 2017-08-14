class Passage < ApplicationRecord
  has_many :cards
  has_many :users, through: :cards

  validates :reference, presence: true, uniqueness: true
end
