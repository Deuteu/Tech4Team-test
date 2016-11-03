class Client < ActiveRecord::Base
  validates :email, uniqueness: true
  enum type: [ :client, :reseller ]
  enum sexe: [ :female, :male ]
  has_many :tickets, dependent: :destroy
end
