class Settings < Settingslogic
  source "#{Rails.root}/config/app_settings.yml"
  namespace Rails.env
end