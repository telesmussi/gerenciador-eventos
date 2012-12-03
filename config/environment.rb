# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Eventos::Application.initialize!

# Comentado => Desenvolvimento/ Caso contrário => Produção
#Rails.env='production'
