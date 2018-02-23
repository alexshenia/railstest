class Hall < ApplicationRecord
  has_many :shows
  has_many :seats
end
