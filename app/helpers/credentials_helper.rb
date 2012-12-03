module CredentialsHelper
  
  def show_payed_rooms(payment)
    room_names = Array.new
    payment.rooms.each do |room|
      room_names << room.name
    end
    room_names.join(', ')
  end
  
  def abbreviate_if_needed (full_name)
    return full_name if full_name.length < 23
    name_array = full_name.split(" ")
    name_array.each do |name|
      name.replace(name[0].chr + ".") if name.length >= 3 && name != name_array.first && name != name_array.last
      break if name_array.join(" ").length < 23
    end
    return name_array.join(" ")
  end
end
