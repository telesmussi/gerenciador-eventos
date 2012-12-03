class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    @upload = Upload.new
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new
    if (params[:popup])
      @popup = "yes"
      render :layout => "popup"
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])
      if @company.save
        flash.now[:success] = 'Empresa criada com sucesso.'
      else
        flash.now[:error] = 'Falha ao cadastrar empresa.'
      end
      if params[:popup]
        @popup = "yes"
        render action: "new", :layout => "popup"
      end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end
  
  # DELETE /companies
  def delete_all
    Company.connection.execute "DELETE FROM companies"
    Participant.connection.execute "UPDATE participants SET company_id = null WHERE company_id IS NOT NULL"
    @companies = Company.all
    redirect_to companies_path
  end
  
  def select
    @companies = Company.order("name asc")
    @selected = Company.last
    render :layout => nil
  end
  
end
