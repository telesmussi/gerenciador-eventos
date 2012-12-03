class PhotosController < ApplicationController
  def create
    @photo = Photo.new(params[:photo])
    @photo.image = File.new(upload_path)
    @participant = Participant.find(params[:participant_id])
    @participant.photo = @photo
    
    if @photo.save && @participant.save
      redirect_to @participant, :flash => { :success => 'Foto vinculada com sucesso!' }
    else
      redirect_to @participant, notice: 'Erro ao vincular foto ao participante'
    end
  end
  
  def new
    @participant = Participant.find(params[:participant_id])
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def index
    @photos = Photo.find :all
  end

  def upload
    File.open(upload_path, 'w') do |f|
      f.write request.raw_post.force_encoding("UTF-8")
    end
    render :text => "ok"
  end

  private

  def upload_path # is used in upload and create
    file_name = session[:session_id].to_s + '.jpg'
    File.join(Rails.root, 'public', 'uploads', file_name)
  end
end
