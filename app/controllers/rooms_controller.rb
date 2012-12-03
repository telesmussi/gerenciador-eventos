class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.json
  def index
    if !current_event?
      redirect_to events_select_path
    else
      @event = current_event
      @rooms = @event.rooms
    end
  end

  # GET /rooms/1
  def show
    @room = Room.find(params[:id])
    @event = @room.event
    respond_to do |format|
      format.html
      format.xls do 
        send_data @room.participants.to_xls(Participant.xls_columns), :filename => "Participantes - #{@event.name} - #{@room.name}.xls"
      end
    end
  end


  # GET /rooms/new
  def new
    @event = Event.find(params[:event_id])
    @room = @event.rooms.build
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
    @event = @room.event
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @event = Event.find(params[:event_id])
    @room = @event.rooms.build(params[:room])
    if @event.save
      redirect_to @event, notice: 'Sala criada com sucesso.'
    else
      render action: "new"
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      redirect_to @room.event, notice: 'Sala alterada com sucesso.'
    else
      render action: "edit"
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @event = Event.find(params[:event_id])
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to @event
  end
end
