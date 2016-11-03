class AddModelRelation < ActiveRecord::Migration
  def change
    add_reference :tickets, :client, index: true, foreign_key: true
    add_reference :tickets, :representation, index: true, foreign_key: true
    add_reference :representations, :spectacle, index: true, foreign_key: true
  end
end
