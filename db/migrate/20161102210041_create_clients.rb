class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :type
      t.string :name
      t.string :firstname
      t.string :email
      t.string :adresse
      t.string :codePostal
      t.string :country
      t.integer :age
      t.integer :sexe

      t.timestamps null: false
    end
  end
end
