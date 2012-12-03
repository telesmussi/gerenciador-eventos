module SessionsHelper

  def sign_in(user)
    cookies.permanent[:user_id] = user.id
    current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
      @current_user ||= User.find(cookies[:user_id]) if cookies[:user_id] && User.exists?(cookies[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  def is_admin?
    signed_in? && current_user.is_admin
  end

  def sign_out
    current_user = nil
    cookies.delete(:user_id)
    cookies.delete(:event_id)
  end
  
  def current_event
    @current_event ||= Event.find(cookies[:event_id]) if cookies[:event_id] && Event.exists?(cookies[:event_id])
  end
  
  def current_event=(event)
    @current_event = event
  end
  
  def select_event(event)
    cookies.permanent[:event_id] = event.id
    current_event = event
  end
  
  def current_event?
    !current_event.nil?
  end

end
