ActionMailer::Base.smtp_settings = {
  address:              AppSettings.mailer_address,
  port:                 AppSettings.mailer_port,
  domain:               AppSettings.mailer_domain,
  user_name:            AppSettings.mailer_user_name,
  password:             AppSettings.mailer_password,
  authentication:       AppSettings.mailer_authentication,
  enable_starttls_auto: AppSettings.mailer_enable_starttls_auto
}