class ImportController < ApplicationController
  def data
  end

  def form
  end

  def import
    require 'csv'
    require 'tempfile'
    file = params[:file]
    recodedFile = Tempfile.new('recodedImport')
    File.open(recodedFile.path, 'w') do |out|
      out << File.open(file.path).read.encode("UTF-8", :invalid=>:replace, :replace=>"?")
    end 
    CSV.foreach(recodedFile.path, :headers => true, col_sep: ";") do |row|
      hashRow = row.to_hash
      if !Ticket.find_by ref: hashRow['Numero billet']
        s = Spectacle.create_with(name: hashRow['Spectacle']).find_or_create_by(cle: hashRow['Cle spectacle'])
        repArgs = {
          name: hashRow['Representation'],
          startDate: hashRow['Date representation'],
          startTime: hashRow['Heure representation'],
          endDate: hashRow['Date fin representation'],
          endTime: hashRow['Heure fin representation'],
          spectacle: s
        }
        r = Representation.create_with(repArgs).find_or_create_by(cle: hashRow['Cle representation'])
        dict = {"F"=>"female", "M"=>"male"}
        s = dict.include? hashRow['Sexe'] ? dict[hashRow['Sexe']] : ""
        clientArgs = {
          kind: hashRow['Type de client'],
          name: hashRow['Nom'],
          firstname: hashRow['Prenom'],
          adresse: hashRow['Adresse'],
          codePostal: hashRow['Code postal'],
          country: hashRow['Pays'],
          age: hashRow['Age'],
          sexe: s
        }
        c = Client.create_with(clientArgs).find_or_create_by(email: hashRow['Email'])
        ticketArgs = {
          ref: hashRow['Numero billet'],
          command: hashRow['Commande'],
          reservation: hashRow['Reservation'],
          resaDate: hashRow['Date reservation'],
          resaTime: hashRow['Heur reservation'],
          price: hashRow['Prix'],
          accessDate: hashRow['Date acces'],
          accessTime: hashRow['Heure acces'],
          tarif: hashRow['Tarif'],
          kind: hashRow['Type de produit'],
          serie: hashRow['Serie'],
          floor: hashRow['Etage'],
          sellPoint: hashRow['Filiere de vente'],
          representation: r,
          client: c
        }
        t = Ticket.new ticketArgs
        t.save
      end
    end
    redirect_to root_path, notice: "Success!"
  end
end
