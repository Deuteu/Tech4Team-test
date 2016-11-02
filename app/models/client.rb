class Client < ActiveRecord::Base
  enum type: [ :client, :reseller ]
  enum sexe: [ :female, :male ]
end
