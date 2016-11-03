class Spectacle < ActiveRecord::Base
  validates :cle, uniqueness: true
  has_many :representations, dependent: :destroy
end
