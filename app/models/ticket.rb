class Ticket < ApplicationRecord
  belongs_to :seat
  belongs_to :show
  belongs_to :user
  validates :seat, uniqueness: { scope: [:show] }
  validates :show, uniqueness: { scope: [:seat] }
  
end
