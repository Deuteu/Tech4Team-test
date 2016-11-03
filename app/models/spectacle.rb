class Spectacle < ActiveRecord::Base
  has_many :representations, dependent: :destroy
end
