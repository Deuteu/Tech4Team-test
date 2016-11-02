class CreateRepresentations < ActiveRecord::Migration
  def change
    create_table :representations do |t|
      t.integer :cle
      t.string :name
      t.date :startDate
      t.time :startTime
      t.date :endDate
      t.time :endTime

      t.timestamps null: false
    end
  end
end
