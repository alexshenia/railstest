class Seat < ApplicationRecord
  belongs_to :hall
  has_many :shows, through: :hall

  def name
    "Row: #{row}, number: #{number}"
  end
end
