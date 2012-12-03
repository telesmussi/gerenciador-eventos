module EntrancesHelper
  
  def badge_for_entrance(entrance)
    entrance.was_allowed ? with_icon("Ok", "icon-ok") : with_icon("Negado", "icon-remove")
  end
  
  
end
