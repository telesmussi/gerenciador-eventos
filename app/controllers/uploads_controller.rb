class UploadsController < ApplicationController
  
  def show
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])
    @upload.save
    if params[:upload_type] == "participants"
      @output = import_participants @upload.file.path, Event.find(params[:event_id])
    elsif params[:upload_type] == "payments"
      @output = import_to_room @upload.file.path, Room.find(params[:room_id]), @event
    elsif params[:upload_type] == "companies"
      @output = import_companies @upload.file.path
    elsif params[:upload_type] == "participants2"
      @output = import_participants2 @upload.file.path
    end
    render action: "show"
  end
  
  def import_participants(file, event)
    output = Array.new
    workbook = Spreadsheet.open file
    sheet = workbook.worksheet 0
    sheet.each 1 do |row|
      participant = Participant.new
      participant.name = row[0]
      if participant.save
        output << "OK!! #{participant.name} ----"
      else
        output << "falhou!! #{participant.name} ----"
      end
      credential = Credential.new
      credential.participant_id = participant.id
      credential.event_id = event.id
      credential.generate_bar_code
      credential.save
    end
    output
  end
  
  def import_to_room(file, room, event)
    output = Array.new
    workbook = Spreadsheet.open file
    sheet = workbook.worksheet 0
    sheet.each 1 do |row|
      participant = Participant.find_by_cpf(row[0])
      if !participant
        output << "CPF nao encontrado (#{row[0]})"
      else
        credential = Credential.where(:participant_id => participant.id, :event_id => event.id).first
        if !credential
          credential = Credential.new
          credential.participant_id = participant.id
          credential.event_id = event.id
          credential.generate_bar_code
          credential.save
        end
        payment = Payment.new
        payment.credential_id = credential.id
        payment.amount = 0
        payment.room_ids = room.id.to_s
      end
    end
  end
  
  def import_companies(file)
    output = Array.new
    workbook = Spreadsheet.open file
    sheet = workbook.worksheet 0
    sheet.each 1 do |row|
      company = Company.new
      company.cod_cliente = row[0]
      company.name = row[1]
      company.fantasy_name = row[2]
      company.cnpj = row[3]
      company.color = row[4]
      if company.save
        output << "Inserido com sucesso: #{company.name} // #{company.fantasy_name} // #{company.cnpj}"
      else
        output << "Falha ao inserir: #{company.name} // #{company.fantasy_name} // #{company.cnpj}"
      end
    end
    output
  end

  def import_participants2(file)
    output = Array.new
    workbook = Spreadsheet.open file
    sheet = workbook.worksheet 0
    sheet.each 1 do |row|
      participant = Participant.new
      participant.name = row[0]
      participant.cpf = row[1]
      participant.company_id = row[2]
      if participant.save
        output << "Inserido com sucesso: #{participant.name} // #{participant.cpf} // #{participant.company_id} "
      else
        output << "Falha ao inserir: #{participant.name} // #{participant.cpf} // #{participant.company_id} "
      end
    end
    output
  end

  
  
end
