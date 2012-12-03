class CredentialsController < ApplicationController

  # GET /credentials/1
  # GET /credentials/1.json
  def show
    @credential = Credential.find(params[:id])
  end

  # GET /credentials/1/edit
  def edit
    @credential = Credential.find(params[:id])
  end

  # POST /credentials
  # POST /credentials.json
  def create
    @participant = Participant.find(params[:participant_id])
    if !@participant.company && current_event.is_company_event
      flash[:error] = "Favor cadastrar uma empresa para este participante."
      redirect_to edit_participant_path(@participant)
      return
    end
    @credential = Credential.new
    @credential.event = Event.find(cookies[:event_id])
    @credential.generate_bar_code
    @participant.is_enterprise = current_event.is_company_event
    @participant.credentials << @credential
    if @participant.save
      flash[:success] = 'Credencial criada com sucesso!'
      redirect_to @credential
    else
      flash[:error] = 'Erro ao gerar credencial para este participante'
      redirect_to edit_participant_path(@participant)
    end
  end

  # PUT /credentials/1
  # PUT /credentials/1.json
  def update
    @credential = Credential.find(params[:id])
    if @credential.update_attributes(params[:credential])
      redirect_to @credential, notice: 'Credencial atualizada com sucesso!'
    else
      render action: "edit"
    end
  end

  # DELETE /credentials/1
  # DELETE /credentials/1.json
  def destroy
    @credential = Credential.find(params[:id])
    @credential.destroy
    redirect_to @credential.participant
  end

  # GET /credentials/print
  def print
    @credential = Credential.find(params[:id])
    render :layout => nil
  end

  def renew
    @credential = Credential.find(params[:id])
    @credential.generate_bar_code
    @credential.save
    redirect_to @credential, notice: 'Codigo de barras renovado para esta credencial. Favor imprimir uma nova copia da etiqueta.'
  end

  # post /credentials/find
  def find_by_bar_code
    @event = Event.find(cookies[:event_id])
    @credential = Credential.where(:bar_code => params[:bar_code], :event_id => cookies[:event_id]).first
    if !@credential
      flash[:error] = 'Credencial nao encontrada.'
      redirect_to participants_path
      return
    end
    redirect_to @credential.participant
  end

end

