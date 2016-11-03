class AddIndexes < ActiveRecord::Migration
  def change
    add_index :clients, :email
    add_index :representations, :cle
    add_index :spectacles, :cle
    add_index :tickets, :ref
  end
end
