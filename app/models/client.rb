class Client < ActiveRecord::Base
  enum type: [ :client, :reseller ]
  enum sexe: [ :female, :male ]
  has_many :tickets, dependent: :destroy
end
