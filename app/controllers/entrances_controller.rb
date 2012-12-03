class EntrancesController < ApplicationController

  # GET /entrances/new
  # GET /entrances/new.json
  def new
    @room = Room.find(params[:room_id])
    @entrance = @room.entrances.build
  end

  def index
    @room = Room.find(params[:room_id])
    @entrances = @room.entrances
    respond_to do |format|
      format.html
      format.xls do 
        send_data @entrances.to_xls(Entrance.xls_columns), :filename => "Relatorio de Entradas - #{@room.event.name} - #{@room.name}.xls"
        return
      end
    end
  end

  # POST /entrances
  # POST /entrances.json
  def create
    @entrance = Entrance.new
    @room = Room.find(params[:room_id])
    @credential = Credential.where(:bar_code => params[:bar_code], :event_id => current_event.id).first
    if !@credential
      @mensagem = "Credencial nao encontrada!!"
      @notice = "error"
      render action: "new"
      return
    end
    @entrance.room = @room
    @entrance.credential = @credential
    @entrance.was_allowed = @credential.rooms.include?(@room) || @room.price == 0
    if @entrance.save
      @mensagem = @entrance.was_allowed ? "Entrada registrada com sucesso." : "Este participante nao tem acesso a esta sala. Favor realizar pagamento."
      @notice = @entrance.was_allowed ? "success" : "error"
    else
      @mensagem = "Houve um erro ao processar esta entrada."
      @notice = "error"
    end
    render action: "new"
  end

end
