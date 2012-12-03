class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  
  def authenticate
    redirect_to signin_path, notice: "Por favor, faca login no sistema." unless signed_in? 
  end
  
  include SessionsHelper
end
