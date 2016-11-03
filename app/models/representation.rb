class Representation < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :spectacle
end
