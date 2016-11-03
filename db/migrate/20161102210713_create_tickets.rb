class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :ref
      t.integer :command
      t.integer :reservation
      t.date :resaDate
      t.time :resaTime
      t.float :price
      t.date :accessDate
      t.time :accessTime
      t.string :tarif
      t.string :kind
      t.string :serie
      t.string :floor
      t.string :sellPoint

      t.timestamps null: false
    end
  end
end
