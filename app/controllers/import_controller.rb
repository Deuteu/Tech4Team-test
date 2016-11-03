class ImportController < ApplicationController
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
      hash = row.to_hash
      if !Ticket.find_by ref: hash['Numero billet']
        ticketArgs = {
          ref: hash['Numero billet'],
          command: hash['Commande'],
          reservation: hash['Reservation'],
          resaDate: hash['Date reservation'],
          resaTime: hash['Heur reservation'],
          price: hash['Prix'],
          accessDate: hash['Date acces'],
          accessTime: hash['Heure acces'],
          tarif: hash['Tarif'],
          type: hash['Type de produit'],
          serie: hash['Serie'],
          floor: hash['Etage'],
          sellPoint: hash['Filiere de vente']
        }
        t = Ticket.new ticketArgs
        t.save
      end
    end
    redirect_to import_path
  end
end
