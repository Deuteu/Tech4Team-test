class Representation < ActiveRecord::Base
  validates :cle, uniqueness: true
  has_many :tickets, dependent: :destroy
  belongs_to :spectacle
end
