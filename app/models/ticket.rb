class Ticket < ActiveRecord::Base
  validates :ref, uniqueness: true
  belongs_to :client
  belongs_to :representation
  has_one :spectacle, through: :representation
end
