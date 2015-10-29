OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1149004348448645', '888f874d3df296635464302a074208c9',{:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end