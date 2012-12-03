class EventsController < ApplicationController

  # GET /events
  def index
    @events = Event.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    @upload = Upload.new
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.build_photo
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to @event, notice: 'Evento criado com sucesso!'
    else
      render action: "new"
    end
  end

  # PUT /events/1
  def update
    @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
        redirect_to @event, notice: 'Evento atualizado com sucesso!'
      else
        render action: "edit"
      end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end
  
  def select
    @events = Event.where(:is_active => true)
  end
  
  def selected
    event = Event.find(params[:id])
    select_event(event)
    redirect_to rooms_path
  end
  
end
