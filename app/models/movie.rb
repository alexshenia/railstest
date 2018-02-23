class Movie < ApplicationRecord
  has_many :shows
  has_many :ticket_sales, through: :shows,  source: :tickets
end
