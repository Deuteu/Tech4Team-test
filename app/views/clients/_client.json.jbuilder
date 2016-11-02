json.extract! client, :id, :type, :name, :firstname, :email, :adresse, :codePostal, :country, :age, :sexe, :created_at, :updated_at
json.url client_url(client, format: :json)