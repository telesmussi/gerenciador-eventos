module RoomsHelper

  def room_status(room)
    qtd = room.participants.count
    limit = room.limit
    if limit.equal?(0)
      label = :important
      text = :Excedido
    elsif qtd/limit < 0.6
      label = :success
      text = :OK
    elsif qtd / limit <= 1
      label = :warning
      text = "Atencao"
    else
      label = :important
      text = "Excedido"
    end
    "<span class=\"label label-#{label}\">#{text}</span>".html_safe
  end

  def room_progress(room)
    qtd = room.participants.count
    limit = room.limit
    percentage = (qtd/limit.to_f  * 100)
    percentage = 100 if percentage > 100
    if percentage < 50.0
      label = :success
    elsif percentage < 75.0
      label = :info
    elsif percentage < 100.0
      label = :warning
    else
      label = :danger
    end
    "<div class=\"progress active  progress-#{label}\"><div class=\"bar\" style=\"width: #{percentage}%;\"></div></div>".html_safe
  end

end
