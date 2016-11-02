class Ticket < ActiveRecord::Base
  enum type: [ :subscription, :individual ]
end
