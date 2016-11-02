class CreateSpectacles < ActiveRecord::Migration
  def change
    create_table :spectacles do |t|
      t.integer :cle
      t.string :name

      t.timestamps null: false
    end
  end
end
