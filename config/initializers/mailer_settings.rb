ActionMailer::Base.smtp_settings = {
  address:              Settings.mailer_address,
  port:                 Settings.mailer_port,
  domain:               Settings.mailer_domain,
  user_name:            Settings.mailer_user_name,
  password:             Settings.mailer_password,
  authentication:       Settings.mailer_authentication,
  enable_starttls_auto: Settings.mailer_enable_starttls_auto
}