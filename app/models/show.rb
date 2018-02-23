class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :hall
  has_many :tickets
end
