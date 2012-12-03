module ApplicationHelper
  
  def exibir
    '<i class="icon-eye-open"></i> Exibir'.html_safe
  end
  
  def alterar
    '<i class="icon-pencil"></i> Alterar'.html_safe
  end
  
  def excluir
    '<i class="icon-trash"></i> Excluir'.html_safe
  end
  
  def voltar
    '<i class="icon-arrow-left"></i> Voltar'.html_safe
  end

  def adicionar
    "<i class=\"icon-plus\"></i> Adicionar".html_safe
  end
  
  def with_icon(entidade, icon_class)
    "<i class=\"#{icon_class}\"></i> #{entidade}".html_safe
  end
  
  def checkbox(valor)
    check_box_tag "check", "dummy", valor, :readonly => true, :disabled => true
  end
  
  def mostra_dado(descricao, valor)
    	"<tr><td><strong>#{descricao}</strong></td><td>#{valor}</td></tr>".html_safe
  end
  
  def hash_table(span_size, hash)
    rows = String.new
    hash.each_pair do |key, value| 
      rows.concat("<tr><td><b>#{key}:</b></td><td>#{value}</td></tr>")
    end
    "<div class=\"row\"><div class=\"#{span_size}\"><table class=\"table table-bordered\">#{rows}</table></div></div>".html_safe
  end
  
end

