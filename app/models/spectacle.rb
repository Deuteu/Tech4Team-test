class Spectacle < ActiveRecord::Base
  validates :cle, uniqueness: true
  has_many :representations, dependent: :destroy
  has_many :tickets, through: :representations, source: :tickets
end
