class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.password  = "damaceno"
    if @user.save
      redirect_to @user, notice: 'Usuario criado com sucesso.'
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    if params[:user][:password] == ""
      params[:user][:password] = @user.password
    end
    
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Usuario alterado com sucesso.'
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      flash[:error] = "Nao foi possivel excluir seu proprio usuario."
    else
      @user.destroy
    end
    redirect_to users_url
  end
end
