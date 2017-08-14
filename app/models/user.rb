class User < ApplicationRecord
  include Clearance::User
  has_many :cards
  has_many :passages, through: :cards
end
