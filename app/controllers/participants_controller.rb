class ParticipantsController < ApplicationController
  # GET /participants
  # GET /participants.json
  def index
    @event = current_event
    @participants = @event.participants
    respond_to do |format|
      format.html
      format.xls do 
        send_data @participants.to_xls(Participant.xls_columns), :filename => "Participantes - #{@event.name}.xls"
      end
    end
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
    redirect_to edit_participant_path(params[:id])
  end

  # GET /participants/new
  # GET /participants/new.json
  def new
    @participant = Participant.new
    @participant.build_address
    @participant.build_company
    @participant.is_enterprise = current_event.is_company_event
    @participant.cpf = params[:cpf] if params[:cpf]
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
    @participant.is_enterprise = current_event.is_company_event
    @credential = Credential.where(:event_id => cookies[:event_id], :participant_id => @participant.id).first
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(params[:participant])
    @participant.is_enterprise = current_event.is_company_event
    if @participant.save
      redirect_to edit_participant_path(@participant), :flash => { :success => 'Participante criado com sucesso!' }
    else
      flash.now[:error] = 'Nao foi possivel cadastrar esse participante. Verifique os campos com erro.'
      render action: "new"
    end
  end

  # PUT /participants/1
  # PUT /participants/1.json
  def update
    @participant = Participant.find(params[:id])
    @participant.is_enterprise = current_event.is_company_event
    if @participant.update_attributes(params[:participant])
      flash[:success] = 'Participante atualizado com sucesso!'
      redirect_to edit_participant_path(@participant)
    else
      flash.now[:error] = 'Nao foi possivel atualizar esse participante. Verifique os campos com erro.'
      render action: "edit"
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to participants_url
  end

  # POST /participants/find
  def find_by_cpf
    cpf = params[:participant_cpf]
    @participant = Participant.find_by_cpf(cpf) if cpf
    redirect_to @participant ? edit_participant_path(@participant) : new_participant_path, :cpf => cpf
  end

   # POST /participants/findbyname
  def find_by_name
    name = params[:participant_name]
    @participant = Participant.find_by_name(name) if name
    redirect_to @participant ? edit_participant_path(@participant) : new_participant_path, :name => name
  end

end
