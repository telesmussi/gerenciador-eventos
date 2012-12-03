class CidadesController < ApplicationController
  def cidades_select
    if params[:estado] != "nenhum"
      @estado = Estado.where(:nome => params[:estado]).first
      @cidades = Cidade.where(:uf => @estado.uf)
    end
    render :layout => nil
  end
end